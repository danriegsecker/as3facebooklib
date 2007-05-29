<?
//
// +---------------------------------------------------------------------------+
// | Facebook Development Platform PHP4 client for API v1.0 by Kevin Fung      |
// +---------------------------------------------------------------------------+
// | Copyright (c) 2007 Facebook, Inc.                                         | 
// | All rights reserved.                                                      |
// |                                                                           |
// | Redistribution and use in source and binary forms, with or without        |
// | modification, are permitted provided that the following conditions        |
// | are met:                                                                  |
// |                                                                           |
// | 1. Redistributions of source code must retain the above copyright         |
// |    notice, this list of conditions and the following disclaimer.          |
// | 2. Redistributions in binary form must reproduce the above copyright      |
// |    notice, this list of conditions and the following disclaimer in the    |
// |    documentation and/or other materials provided with the distribution.   |
// |                                                                           |
// | THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR      |
// | IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES |
// | OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.   |
// | IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,          |
// | INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT  |
// | NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, |
// | DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY     |
// | THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT       |
// | (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF  |
// | THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.         |
// +---------------------------------------------------------------------------+
// | For help with this library, contact developers-help@facebook.com          |
// +---------------------------------------------------------------------------+
//

//lots of changes needed from the original sample code because of how they are parsed in the 2 PHP versions
//but they are just array arrangement changes
//this is the version with mysql database tracking user sessions instead of using cookies
//remember when you link to other pages put ?uid=UIDHERE i.e. nextpage.php?uid=2387483742323
//remember they have to use the logout function from config.php or they won't get logged out until idle time is exceeded

include_once 'facebook_conf.php';
include_once 'facebookapi_php4_restlib.php';

require('config.php');

$uid = $_GET['uid'];

//if there's no uid, redirect it to the login page
if($uid == "") {
	header('Location: loginsql.php');
	die;
}

//make sure the user is valid, check ip, last active time
$ip = $_SERVER['REMOTE_ADDR'];
$time = time();
$idletime = $time - 60 * $idle;
$sql  = " SELECT session_key FROM fbapi_users WHERE uid = $uid AND ip = '$ip' AND lastactive > $idletime ";
$rs = mysql_query($sql,$cid);
$row = mysql_fetch_array($rs);
$session_key = $row["session_key"];
if(session_key == "")
	header('Location: loginsql.php?uid='.$uid);

$client = new FacebookRestClient($config['rest_server_addr'], $config['api_key'], $config['secret'], $session_key, false);
  
// Get the entire user profile.
$user_profile = $client->users_getInfo($uid, implode(",", $profile_field_array));
$user_name = $user_profile['users_getInfo_response']['user']['first_name'];
//if user name is nonexistent, then the user probably logged out of facebook already
if($user_name == "")
	header('Location: loginsql.php?uid='.$uid);
  
  // Use FQL to get 5 random friends in 2 of your networks, if 2nd network is empty it won't return any error
  $user_affiliations = $user_profile['users_getInfo_response']['user']['affiliations']['affiliation'];
  $affil_name = $user_affiliations[0]['name'];
  $affil_name1 = $user_affiliations[1]['name'];
  if (isset($user_affiliations[0]) && isset($affil_name))
  {
  
    $query = 'SELECT name, uid FROM user WHERE uid IN'
      . ' (SELECT uid2 FROM friend WHERE uid1= ' . $uid . ')'
      . ' AND ("' . $affil_name . '" IN affiliations.name OR "' . $affil_name1 . '" IN affiliations.name)';
	$fqlreturn = $client->fql_query($query); //get the array first and then take stuff inside the array
	$random = rand(0, count($fqlreturn['fql_query_response']['user']) -5);
    $affil_friends = array_slice($fqlreturn['fql_query_response']['user'], $random, 5);
  }
  
  // Get random five of the user's friends.
  //get all of user's friends first
  $friends_array = $client->friends_get();
  //then slice it
  if(!empty($friends_array['friends_get_response'])) {
  $random = rand(0, count($friends_array['friends_get_response']['uid']) -5);
  $friends_array = array_slice($friends_array['friends_get_response']['uid'], $random, 5);
  $friend_profiles = $client->users_getInfo(implode(",", $friends_array), implode(",", $profile_field_array));
  }
  
  // See if these two friends know each other.
  if (isset($friends_array[0]) && isset($friends_array[1]))
  {
    $friend_info = $client->friends_areFriends($friends_array[0], $friends_array[1]);
  }
  // Get all of this user's photo albums.
  $albums = $client->photos_getAlbums($uid, null);
  if (!empty($albums['photos_getAlbums_response']['album'])) {
	//if user only has 1 album, do this:
	if(empty($albums['photos_getAlbums_response']['album'][0])) {
	$album = $albums['photos_getAlbums_response']['album'];
	} else {
    $album = $albums['photos_getAlbums_response']['album'][0];
	}
    // Get all photos from this album.
    $album_photos = $client->photos_get(null, $album['aid'], null);
  }

  
  // Get events for the next few weeks.
  $events = $client->events_get($uid, null, time(), time() + (86400 * 21), null);

  if (isset($events['events_get_response']['event'][0]))
  {
    $first_event_eid = $events['events_get_response']['event'][0]['eid'];
    $event_members = $client->events_getMembers($events['events_get_response']['event'][0]['eid']);
    $event_count = count($event_members['events_getMembers_response']['attending']['uid']);
  } else {
    // do this if there is only 1 event
  	$first_event_eid = $events['events_get_response']['event']['eid'];
    $event_members = $client->events_getMembers($events['events_get_response']['event']['eid']);
    $event_count = count($event_members['events_getMembers_response']['attending']['uid']);
  }
                    
  // Get all photos of a random user, pick 10 random phtoso.
  $photosarray = $client->photos_get($friends_array[2], null, null);
  if(!empty($photosarray['photos_get_response'])) {
  $random = rand(0, count($photosarray['photos_get_response']['photo']) -5);
  $photos = array_slice($photosarray['photos_get_response']['photo'], $random, 10);
  }
  // Get all notifications for the current user.
  $notificationsarray = $client->notifications_get();
  $notifications = $notificationsarray['notifications_get_response'];

  // Get the user's groups, and save a few randomly
  $groupsarray = $client->groups_get($uid, null);
  if(!empty($groupsarray['groups_get_response'])) {
  $random = rand(0, count($groupsarray['groups_get_response']['group']) -5);
  $groups = array_slice($groupsarray['groups_get_response']['group'], $random, 5);
  }

?>
<html><head><title>Example PHP4 REST Client by Kevin Fung</title></head>
<body>
</body>
<? //this is the link for user to logout ?>
<a href="<?=$_SERVER[PHP_SELF];?>?uid=<?=$uid?>&logout=1">Log out</a>
<p>
<?

print "<h2>Hello $user_name!</h2>";

print '<P>You have '. $notifications['messages']['unread'] .' new ' . 
      (($notifications['messages']['unread'] == 1) ? 'message' : 'messages');

//make sure user has more than 2 friends first
if(isset($friend_profiles['users_getInfo_response']['user'][0]) && $friend_profiles['users_getInfo_response']['user'][1]) {
print '<p>' . $friend_profiles['users_getInfo_response']['user'][0]['first_name'] . ' ' . $friend_profiles['users_getInfo_response']['user'][0]['last_name'] . ' and ' . $friend_profiles['users_getInfo_response']['user'][1]['first_name'] . ' ' . $friend_profiles['users_getInfo_response']['user'][1]['last_name'] .
      ($friend_info['friends_areFriends_response']['friend_info']['are_friends'] ? ' are friends.' : ' are not friends.');
}
	  
print '<h3>This is your profile:</h3>';
print_profiles($user_profile['users_getInfo_response']);
print "<HR>";

//do if more than 1 friend
if(sizeof($friend_profiles['users_getInfo_response']['user']) > 1) {
print '<h3>Here are some of your friends profiles</h3>';
print_profiles($friend_profiles['users_getInfo_response']['user']);
}

if ($affil_name && $affil_friends)
{
  if(isset($affil_name1))
  print "<hr><p><h3>Here are some friends from the $affil_name and $affil_name1 network:</h3><P>";
  else
  print "<hr><p><h3>Here are some friends from the $affil_name network:</h3><P>";
  foreach ($affil_friends as $affil_friend)
  {
    print $affil_friend['name'] . '<P>';
  }
}
//print_r($events['events_get_response']);
if (is_array($events['events_get_response'])) {
print "<hr><p><h2>Your upcoming events </h2><P>";
//if only 1 event
if(!isset($events['events_get_response']['event'][0])) {
    print "<P><h4>" . $events['events_get_response']['event']['name'] . '</h4>';
    print "<P>Starts at: " . date('l dS \of F Y h:i:s A' , (int) ($events['events_get_response']['event']['start_time']));
    print "<P>Ends at: " . date('l dS \of F Y h:i:s A' , (int) ($events['events_get_response']['event']['end_time']));
    print "<P>The event venue is: " . $events['events_get_response']['event']['location'];
    if ($events['events_get_response']['event']['eid'] == $first_event_eid)
    {
      print "<P>There " . (($event_count == 1) ? 'is 1 person' : 
        "are $event_count people") . " attending this event.";
    }
    print "<hr>";
} else {
  //for more than 1 events
  foreach ($events['events_get_response']['event'] as $id => $event) {
    print "<P><h4>" . $event['name'] . '</h4>';
    print "<P>Starts at: " . date('l dS \of F Y h:i:s A' , (int) ($event['start_time']));
    print "<P>Ends at: " . date('l dS \of F Y h:i:s A' , (int) ($event['end_time']));
    print "<P>The event venue is: " . $event['location'];
    if ($event['eid'] == $first_event_eid)
    {
      print "<P>There " . (($event_count == 1) ? 'is 1 person' : 
        "are $event_count people") . " attending this event.";
    }
    print "<hr>";
  }
}
}

if (isset($groups)) {
  print "<h2>Some groups you are in</h2>";
  foreach($groups as $group) {
    $pic_src = htmlspecialchars_decode($group['pic']);
    print '<img border=0 src="'.$pic_src.'"><br/>'.$group['name'].'</a><p>';
  }
}

if (is_array($photos)) {
  print "<h2>Photos of " . $friend_profiles['users_getInfo_response']['user'][2]['first_name'] . ' ' . $friend_profiles['users_getInfo_response']['user'][2]['last_name'] . "</h2>";
  print "<hr>";
  foreach($photos as $photo) {
    $photo_url = htmlspecialchars_decode($photo['src']);
    print '<img style="margin: 2px;" src="'. $photo_url . '">';
  }
}

if (isset($album_photos)) {
  print "<hr>";
  print "<h2>Photos from your album: $album[name]</h2>";
  print '<div style="clear: both;">';
  foreach($album_photos['photos_get_response']['photo'] as $photo) {
    $photo_src = htmlspecialchars_decode($photo['src']);
    $photo_link = htmlspecialchars_decode($photo['link']);
    print '<div style="float: left; width: 150px;"><a href="'.$photo_link.'">';
    print '<img border=0 src="'.$photo_src.'"><br/>'.$photo['caption'].'</a></div>';
  }
  print '</div>';
}

print "</body></html>";


function print_profiles($profiles)
{
  foreach ($profiles as $id => $profile) {
    print "<h4>$profile[name] (id " . $profile['uid'] . ")</h4>";
    $pic = htmlspecialchars_decode($profile['pic']);
    if ($pic) {
      print "<img src=\"$pic\">\n";
    }
    print '<pre style="overflow: hidden;">';
    print_r($profile);
    print '</pre>';
  }
}

//php4 needs this
function htmlspecialchars_decode($text) {
       return strtr($text, array_flip(get_html_translation_table(HTML_SPECIALCHARS)));
}
?>