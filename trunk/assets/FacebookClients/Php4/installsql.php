<?
require( 'config.php' );
    mysql_select_db($db, $cid);

	$sql  = " CREATE TABLE fbapi_users  (";
    $sql .= "   uid INT(100) NOT NULL, ";
    $sql .= "   ip VARCHAR(100) NOT NULL, ";
	$sql .= "   session_key VARCHAR(255) NOT NULL, ";
	$sql .= "   lastactive INT(100) NOT NULL, ";
    $sql .= " PRIMARY KEY(uid) ";
    $sql .= " );  ";
    $calldb = mysql_query($sql, $cid);
    if (mysql_error()) { print "Datbase ERROR: $sql <br>" . mysql_error(); }
    print "Create Table Results RESULT = $calldb\n\nDelete This File";
	
?>