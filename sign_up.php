<?php

require_once("db_login.php");
$error_msg = "";
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $validate = registerUser($_POST['username'], $_POST['password'], $_POST['repeat_password']);
    if($validate === false){
        $error_msg = "<div style='color: #990000;font-size:0.8em;'>
        Username is already taken<br />Please try again</div>";
    }
    if($validate == 'pwd'){
        $error_msg = "<div style='color: #990000;font-size:0.8em;'>
        Passwords did not match<br />Please try again</div>";
    }

}
if (!isset($_SESSION['valid'])){
require_once('header.php');
echo("
<form action='sign_up.php' method='POST' class='large'>
    $error_msg
    <input type='text' name='username' placeholder='Username' /><br />
    <input type='password' name='password' placeholder='Password' /><br />
    <input type='password' name='repeat_password' placeholder='Repeat Password' /><br />
    <input type='submit' value='Submit' />
</form>

");
}else{

}
require_once('footer.php');
?>


