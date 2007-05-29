<?
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

//the main difference than the cookie version is now when you send user to a new page you need to attatch the user's id as well
//i.e when you send them to new page, the page will be: something.php?uid=UIDHERE
//WARNING: users MUST log out from this site explicitly. this method cannot clear sessions if the user only logged out from facebook but not this site
//so if the user logged out of facebook.com, they can continue to go through these pages as long as they still have a session in the mysql database.
//the session will not expire until after whatever the idle time you set to (default 10 minutes)

//this is an extra page to process login and then redirect user to sample_client.php, probably could do without it
include_once 'facebook_conf.php';
include_once 'facebookapi_php4_restlib.php';

//connect to mysql database
require 'config.php';

//get user's ip address and current time, make sure their last page accessed on this site was 10 minutes ago or they'd have to login through facebook again.
$ip = $_SERVER['REMOTE_ADDR'];
$time = time();
$idletime = $time - 60 * $idle;
$sql  = " SELECT uid, session_key FROM fbapi_users WHERE ip = '$ip' AND lastactive > $idletime ";
$rs = mysql_query($sql,$cid);
$row = mysql_fetch_array($rs);
$uid = $row["uid"];
$session_key = $row["session_key"];
	
if($session_key == "") {

//if no auth_token, delete all records with current uid if any exists, and go to facebook's login page
$auth_token = $_REQUEST['auth_token'];
if (!$auth_token) {
  $uid = $_GET['uid'];
  if($uid != "") {
  	$sql  = " DELETE FROM fbapi_users WHERE uid = '$uid' ";
    $calldb = mysql_query($sql, $cid);
    if (mysql_error()) { print "Database Error: $sql " . mysql_error();}
  }
  header('Location: '.$config['login_url']);
  exit;
}

  // Create our client object.  
  // This is a container for all of our static information.
  $client = new FacebookRestClient($config['rest_server_addr'], $config['api_key'], $config['secret'], null, false);

  // The required call: Establish session 
  // The session key is saved in the client lib for the whole PHP instance.
  $session_info = $client->auth_getSession($auth_token);
  $session_key = $session_info['auth_getSession_response']['session_key'];
  $uid = $session_info['auth_getSession_response']['uid'];
  
  //delete any previous stored sessions with the same uid
  $sql  = " DELETE FROM fbapi_users WHERE uid = '$uid' ";
  $calldb = mysql_query($sql, $cid);
  if (mysql_error()) { print "Database Error: $sql " . mysql_error();}
  
  //inser information into database
  $sql  = " INSERT INTO fbapi_users (uid, session_key, ip, lastactive) VALUES ('$uid','$session_key','$ip','$time') ";
  $calldb = mysql_query($sql, $cid);
  if (mysql_error()) { print "Database Error: $sql " . mysql_error(); }
  
	//destroy client and set it back again with the session key
	$client = null;
	$client = new FacebookRestClient($config['rest_server_addr'], $config['api_key'], $config['secret'], $session_key, false);
	
	//set the cookies
	//setcookie('facebook_session_key', $session_key);
	//setcookie('facebook_uid', $uid);
	
} else {
	
	$sql  = " UPDATE fbapi_users SET";
	$sql .= " lastactive = '$time' ";
	$sql .= " WHERE uid = '$uid' AND session_key = '$session_key' ";
	$calldb = mysql_query($sql,$cid);
    if (mysql_error()) { print "Database Error: $sql " . mysql_error(); }
	
}
	//redirect to sample_client.php
	header('Location: clientsql.php?uid='.$uid);
?>