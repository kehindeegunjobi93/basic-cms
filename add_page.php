<?php
//this page handles the add a page form

require('includes/utilities.inc.php');

if(!$user->canCreatePage()) {
    header("Location:index.php");
    exit;
}

//create a new form with pear quickform
set_include_path(get_include_path() . PATH_SEPERATOR . "/usr/lib/pear");
require('HTML/QuickForm2.php');
$form = new HTML_QuickForm2 ('addPageForm');

//add the title field
$title = $form->addElement('text', 'title');
$title->setLabel('Page Title');
$title->addFilter('strip_tags');
$title->addRule('required', 'Please enter a page title');

//add the content field
$content = $form->addElement('textarea', 'content');
$content->setLabel('Content');
$content->addFilter('trim');
$title->addRule('required', 'Please enter the page content');

//add submit button
$submit = $form->addElement('submit', 'submit', array('value' => 'Add Page'));

//check for a form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST'){

    //Validate form data
    if($form->validate()){

        //Insert into database
        $q = "INSERT INTO pages (creatorId, title, content, dateAdded) VALUES (:creatorId, :title, :content, NOW())";
        $stmt = $pdo->prepare($q);
        $r = $stmt->execute(array(':creatorId' => $user->getId(), ':title' => $title->getalue(), ':content' => $content->getValue()));

        //freeze the form upon success
        if ($r) {
            $form->toggleFrozen(true);
            $form->removeChild($submit);
        }
    }
}

$pageTitle = 'Add a page';
include('includes/header.inc.php');
include('views/add_page.html');
include('includes/footer.inc.php');

?>
