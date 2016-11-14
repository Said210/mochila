<?php

    require_once 'oom/OOM.php';

    class User extends OOM{
        function __construct(){
            $this->model_name = "usuario";
            $this->private = ["password"];
        }
    }
    $User = new User(); // Optional, but cool.
?>