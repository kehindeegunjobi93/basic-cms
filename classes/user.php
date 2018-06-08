<?php

/* Class User.
 * The class contains six attributes: id, userType, username, email, pass, and
dateAdded.
 * The attributes match the corresponding database columns.
 * The class contains four methods:
 * - getId()
 * - isAdmin()
 * - canEditPage()
 * - canCreatePage()
 */

class User {
// All attributes correspond to database columns.
 // All attributes are protected.

    protected $id = null;
    protected $userType = null;
    protected $username = null;
    protected $email = null;
    protected $pass = null;
    protected $dateAdded = null;


    function getId(){
        return $this->id;
    }

    //returns a boolean indicating if user is an admin
    function isAdmin(){
        return ($this->userType == 'admin');
    }

    //this method returns a boolean indicating if user is admin or if user is the author of the provided page
    function canEditPage(Page $p){
        return ($this->isAdmin() || ($this->id == $page->getCreatorId()));
    }

    //method returns a boolean indicating if user is admin or a author
    function canCreatePage(){
        return ($this->isAdmin() || ($this->userType == 'author'));
    }
}