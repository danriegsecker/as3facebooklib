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

//this is an extra page to process login and then redirect user to sample_client.php, probably could do without it
include_once 'facebook_conf.php';
include_once 'facebookapi_php4_restlib.php';

//only do these if session_key cookie isn't set, otherwise redirect to the page after login.
if(empty($_COOKIE['facebook_session_key'])) {

//clear cookies and send user to login page if no auth_token
$auth_token = $_REQUEST['auth_token'];
if (!$auth_token) {
  $cookiesSet = array_keys($_COOKIE);
  for ($x=0;$x<count($cookiesSet);$x++) setcookie($cookiesSet[$x],"",time()-1);
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
  
	//destroy client and set it back again with the session key
	$client = null;
	$client = new FacebookRestClient($config['rest_server_addr'], $config['api_key'], $config['secret'], $session_key, false);
	
	//set the cookies
	setcookie('facebook_session_key', $session_key);
	setcookie('facebook_uid', $uid);
	
}
	//redirect to sample_client.php
	header('Location: clientcookies.php');
?>