<?php
//This page logs out the user

include('includes/utilities.inc.php');

if($user) {

   //clear the ariables 
   $user = null;

   //clear the session data
   $_SESSION = array();

   //clear the cookie
   setcookie(session_name(), false, time()-3600);

   //destroy the session data
   session_destroy();

}

//set page title and display page
$pageTitle = "Logout";
include('includes/header.inc.php');
include('views/logout.html');
include('includes/footer.inc.php');

?>