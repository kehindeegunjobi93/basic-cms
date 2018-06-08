<?php
//This page displays a full page of content

//require utilities file
require('includes/utilities.inc.php');

try {
    //validate page id
    if(!isset($_GET['id']) || !filter_var($_GET['id'], FILTER_VALIDATE_INT, array('min_range' => 1))) {
 throw new Exception ("An invalid page is was provided to this page");
    }

//fetch page from the databse
$q = 'SELECT id, title, content, DATE_FORMAT(dateAdded, "%e, %M %Y") AS dateAdded FROM pages WHERE id=:id';
$stmt = $pdo->prepare($q);
$r = $stmt->execute(array(':id' => $_GET['id']));

//if query is okay, fetch the record into an object
if($r){
    $stmt->setFetchMode(PDO::FETCH_CLASS, 'Page');
    $page = $stmt->fetch();

    //confirm that it exists
    if($page) {
        //set the browser page title
        $pageTitle = $page->getTitle();

        //create the page
        include('includes/header.inc.php');
        include('views/page.html');
    } else {
        throw new Exception("An inalid page id was provided to this page.");
    }
    } else {
        throw new Exception("An invalid page id was provided to this page");
    }
    
} catch (Exception $e) {
    // catch any generic eceptions
    $pageTitle = "Error!";
    include('includes/header.inc.php');
    include('views/error.html');
}

//include the footer
include('includes/footer.inc.php');
?>