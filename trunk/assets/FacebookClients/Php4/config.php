<?
error_reporting(1);
//database connect info
$usr = "MYSQL_USERNAME";
$pwd = "MYSQL_PASSWORD";
$db = "MYSQL_DATABASE";
$host = "localhost";
$cid = mysql_connect($host,$usr,$pwd); mysql_select_db($db); 
$calldb = mysql_query($sql, $cid);
if (!$cid) { echo("ERROR: " . mysql_error() . "\n");    }

//you can set how long (in minutes) you want the user to stay logged in once idle, default is 10
$idle = 10;

//process logout
if($_GET['logout'] == 1) {
	$uid = $_GET['uid'];
	ob_start();
	print"
	<form name=\"logout\" method=\"post\" action=\"http://www.facebook.com/logout.php\"> 
	  <input type=\"hidden\" name=\"confirm\" value=\"1\"/>
	</form>
	";
	$sql  = " DELETE FROM fbapi_users WHERE uid = '$uid' ";
    $calldb = mysql_query($sql, $cid);
    if (mysql_error()) { print "Database Error: $sql " . mysql_error();}
	echo "<script language=javascript>document.logout.submit();</script>";
	die;
}
?>