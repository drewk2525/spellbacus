<?php
require_once('header.php');
if (!isset($_SESSION['valid'])){
?>
<form action='index.php' method='POST' class='large'>
    <input type='text' name='username' placeholder='Username' /><br />
    <input type='password' name='password' placeholder='Password' /><br />
    <input type='submit' value='Login' />
</form>

<?php
}else{
    require_once('application.php');
}
require_once('footer.php');
?>


