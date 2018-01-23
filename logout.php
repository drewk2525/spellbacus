<?php
session_start();
require_once('db_login.php');
logout();
header("Location: index.php");
?>