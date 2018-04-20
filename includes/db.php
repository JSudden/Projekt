<?php
$mysqli = new mysqli("localhost","root","","exempel");
if($mysqli ->connect_errno)
{
    echo "failed to connect to MYSQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
?>