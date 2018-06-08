<?php 
//This page both displays and handles the login form

//need the utilities file
require('includes/utilities.inc.php');

//creating a new form with PEAR package
set_include_path(get_include_path() . PATH_SEPARATOR . "/usr/lib/pear");
require('HTML/QuickForm2.php');
$form = new HTML_QuickForm2('loginForm');

//add email field
$email = $form->addElement('text', 'email');
$email->setLabel('Email_Address');
$email->addFilter('trim');
$email->addRule('required', 'Please enter your email address');
$email->addRule('email', 'Please enter your email address');


//add password field
$password = $form->addElement('password', 'pass');
$password->setLabel('Password');
$password->addFilter('trim');
$password->addRule('required', 'Please enter your address');

//add submit button
$form->addElement('submit', 'submit', array('value'=>'Login'));

//check for a form submission
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    //Handle form submission

    if ($form->validate()) {

        //check against the database
        $q = 'SELECT id, userType, username, email FROM users WHERE email=:email AND pass=SHA1(:pass)';
        $stmt = $pdo->prepare($q);
        $r = $stmt->execute(array(':email' => $email->getValue(), ':pass' => $password->getValue()));

        //try to fetch the results
        if ($r){
            $stmt->setFetchMode(PDO::FETCH_CLASS, 'User');
            $user = $stmt->fetch();
        }

        //store the user in the session and redirect
        if($user){
            $_SESSION['user'] = $user;
            
            //redirect
            header('Location:index.php');
            exit;
        }

        
 
    }
}

$pageTitle = 'Login';
        include('includes/header.inc.php');
        include('views/login.html');
        include('includes/footer.inc.php');

 ?>