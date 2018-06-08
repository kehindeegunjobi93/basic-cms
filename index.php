<?php require('includes/utilities.inc.php');

//Including the header
$pageTitle = 'Welcome to My Site';
include('includes/header.inc.php');

//fetch the three most recent pages
try {
    $q = "SELECT id, title, content, DATE_FORMAT(dateAdded, '%e %M %Y') AS dateAdded FROM pages ORDER BY dateAdded 
    DESC LIMIT 3";
    $r = $pdo->query($q);

    //check that rows were returned
    if($r && $r->rowCount() > 0){
       $r->setFetchMode(PDO::FETCH_CLASS, 'Page');
       include('views/index.html');
    } else {
        //problem
        throw new Exception('No content is available to be viewed at this time');
    }
} catch (Exception $e) {
      include('views/error.html');
}

//include the footer
include('includes/footer.inc.php');
?>