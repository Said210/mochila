<?php
    require_once 'oom/src/OOM.php';
    class User extends OOM{
        function __construct(){
            $this->model_name = "usuario";
            $this->private = ["password"];
        }

    }
    $u = new User(); // Optional, but cool.
?>