<?php
ini_set("session.cookie_domain",substr($_SERVER['HTTP_HOST'],3));
if(!isset($_SESSION)) session_start();


require_once('db_login.php');
$validated = true;
$error= '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && basename($_SERVER['PHP_SELF']) != 'sign_up.php' && basename($_SERVER['PHP_SELF']) != 'add_spells.php') {
    $validated = validateUser($_POST['username'], $_POST['password']);
    if($validated === false && basename($_SERVER['PHP_SELF']) != 'sign_up.php'){
        $error = "<div style='color: #990000;font-size:0.8em;position:absolute;top:0;right:0;'>
        Username or Password invalid<br />Please try again</div>";
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
    <meta name="description" content="Spellbacus - Help organize your Pathfinder character's spells!" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Spellbacus</title>
    <link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />
    <link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>
    <!-- <link rel="SHORTCUT ICON" href="images/icon.ico" /> -->
    </head>

<body  data-ng-app="myApp">
	<div id='wrapper' data-ng-controller="appController">
	    <header>
            <div class='login'>
                <?php
                if(basename($_SERVER['PHP_SELF']) != 'index.php' && !isset($_SESSION['valid'])){
                    echo("<form action='index.php' method='get'>
                        <button class='home' type='submit'>Return Home</button>
                    </form>");
                }
                if (isset($_SESSION['valid'])){
                    echo("Welcome: ".$_SESSION['username']);
                    echo("<div class='user_data'>
                            <a href='logout.php'>Sign Out</a>
                          </div>");
                    /*echo"
                    <div class='user_data'>
                        <select>
                            <option value=''>Select Character</option>
                            <option value=''>Harry Potter</option>
                            <option value=''>Dumbledore</option>
                            <option value=''>Legolas</option>
                        </select><br />
                        <a href='#'>New Character</a> | <a href='logout.php'>Sign Out</a>
                    </div>
                    ";*/
                }else{
                echo("
                    $error
                    <form action='index.php' method='POST'>
                        <input type='text' name='username' placeholder='Username' /><br />
                        <input type='password' name='password' placeholder='Password' /><br />
                        <input type='submit' value='Login' />
                    </form>");
                }
                ?>
            </div>
	    </header>
		<div id='bodyWrapper'>
