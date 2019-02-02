<?php

$host = "localhost"; /* Host name */
$user = "splituser"; /* User */
$password = "1234"; /* Password */
$dbname = "splitwisedev"; /* Database name */

$conn = mysqli_connect($host, $user, $password,$dbname);
// Check connection
if (!$conn) {
 die("Connection failed: " . mysqli_connect_error());
}
