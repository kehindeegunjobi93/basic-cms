<?php
// This page does the set up and configuration needed by every other page.

// This function will autoload classes from the classes directory:
function class_loader ($class){
    require('classes/' . $class . '.php');
}

spl_autoload_register('class_loader');

// starts the session:
session_start();

// check if the user is in session:
$user = (isset($_SESSION['user'])) ? $_SESSION['user'] : null; 

//create the database connection using pdo
try {
  $pdo = new PDO('mysql:dbname=cms; host=localhost', 'root', '');  
} catch (PDOException $e) //checkking for an error 
{
    $pageTitle = 'Error Page!';
    include('includes/header.inc.php');
    include('views/error.html');
    include('includes/footer.inc.php');
    exit();
}
