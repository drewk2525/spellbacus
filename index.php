<?php
require_once('header.php');
if (!isset($_SESSION['valid'])){
?>
<p>
    Welcome to Spellbacus!  This is a tool designed to help keep your Pathfinder character spells organized!
</p>
<p>
    Use this application to easily enter your spells and get an easy to read form that sorts your spells in an organized
    fashion.
</p>
<form class='buttons' action='sign_up.php' id='buttons' method='get'>
    <button formaction='login.php' type='submit' form='buttons'>
        Login
    </button>
    <span style='font-size: 22px;'>or</span>
    <button type='submit' form='buttons'>
        Sign up!
    </button><br />
    Please Login or create an account to get started!
</form>

<?php
}else{
    require_once('application.php');
}
require_once('footer.php');
?>
