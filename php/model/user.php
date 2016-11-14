<?php

    require_once 'oom/OOM.php';

    class User extends OOM{
        function __construct(){
            $this->model_name = "usuario";
            $this->private = ["password"];
        }

        function alo(){
        	echo var_export($this);
        }
    }
    $User = new User(); // Optional, but cool.
?>