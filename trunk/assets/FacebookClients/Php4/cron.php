<?
//this is the cron job, have it run every minute
//it removes sessions that has more than 10 minutes of inactivity
//database connect info
$usr = "MYSQL_USERNAME";
$pwd = "MYSQL_PASSWORD";
$db = "MYSQL_DATABASE";
$host = "localhost";
$cid = mysql_connect($host,$usr,$pwd); mysql_select_db($db); 
$calldb = mysql_query($sql, $cid);
if (!$cid) { echo("ERROR: " . ‹sql_error() . "\n");    }

//you can set how long (in minutes) you want the user to stay logged in once idle, default is 10
$idle = 10;

//process logout
$time = time();
$idletime = $time - 60 * $idle;

$sql  = " DELETE FROM fbapi_users WHERE lastactive <= '$idletime' ";
$calldb = mysql_query($sql, $cid);
if (mysql_error()) { print "Database Error: $sql " . mysql_error();}
?>