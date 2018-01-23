<?php //db_login.php

function validateUser($username, $password){
	//create a new PDO connection, and connect to our ssl database

    /* Local Machine Credentials
    $dbh = new PDO('mysql:host=localhost;dbname=pathfinder;charset=utf8', 'root', 'root');
    */
    // Server Credentials
    $dbh = new PDO('mysql:host=localhost;dbname=drewk225_pathfinder;charset=utf8', 'drewk225_drew', 'PennyLane35');

        if (!$dbh) die("Unable to connect to MySQL: " .mysqli_error($conn));
	//Prepare our MySQL to find user
    $stmt=$dbh->prepare("SELECT * FROM users WHERE LCASE(username)=LCASE(:username) LIMIT 1");
    $stmt->bindParam(':username',$username);
    //execute our MySQL query
    $stmt->execute();
    //set results to variable
    $result = $stmt->fetchall(PDO::FETCH_ASSOC);
    if(!isset($result[0])){ return false;}
    $user = $result[0]['username'];
    $salt = $result[0]['salt'];
    $password = createHash($password, $salt);
    //Prepare our MySQL to match user with password
    $stmt=$dbh->prepare("SELECT * FROM users WHERE LCASE(username)=:username AND password=:password LIMIT 1");
    $stmt->bindParam(':username',$username);
    $stmt->bindParam(':password',$password);
    //execute our MySQL query
    $stmt->execute();
    //set results to variable
    $result = $stmt->fetchall(PDO::FETCH_ASSOC);
    if($result){
        if(!isset($_SESSION)) session_start();
        $_SESSION['valid'] = 1;
        $_SESSION['id'] = $result[0]['id'];
        $_SESSION['username'] = $result[0]['username'];
	} else {
	    return false;
	}
}

function registerUser($username, $password, $repeat){
    if($password != $repeat)
        return 'pwd';
    $user='root';
    $pass='root';
	//create a new PDO connection, and connect to our ssl database


    /* Local Machine Credentials
    $dbh = new PDO('mysql:host=localhost;dbname=pathfinder;charset=utf8', 'root', 'root');
    */
    // Server Credentials
    $dbh = new PDO('mysql:host=localhost;dbname=drewk225_pathfinder;charset=utf8', 'drewk225_drew', 'PennyLane35');


        if (!$dbh) die("Unable to connect to MySQL: " .mysqli_error($conn));
	//Prepare our MySQL to check if user exists
    $stmt=$dbh->prepare("SELECT * FROM users WHERE LCASE(username)=LCASE(:username) LIMIT 1");
    $stmt->bindParam(':username',$username);
    //execute our MySQL query
    $stmt->execute();
    //set results to variable
    $result = $stmt->fetchall(PDO::FETCH_ASSOC);
	//if user doesn't exist, add user to database
	if(isset($result[0])){
	    return false;
    } else {
	    $salt = createSalt();
	    $pwd = createHash($password, $salt);
	    $stmt=$dbh->prepare("INSERT INTO users (username, password, salt) VALUES (:username, :password, :salt)");
	    $stmt->bindParam(':username',$username);
	    $stmt->bindParam(':password',$pwd);
	    $stmt->bindParam(':salt',$salt);
        //execute our MySQL query
        $stmt->execute();
        validateUser($username, $password);
        require_once('header.php');
        require_once('application.php');
        require_once('footer.php');
        //header("Location: index.php");
        die();
	}
}

function logout(){
	$_SESSION = array();
	session_destroy();
}

function createSalt(){
	$string = md5(uniqid(rand(), true));
	return substr($string, 0, 3);
}

function createHash($password, $salt){
    $hash = hash('sha256', $password);
    $hash = hash('sha256', $salt.$hash);
    return $hash;
}


?>