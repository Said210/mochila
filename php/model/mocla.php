<?php

    require_once 'oom/OOM.php';

    class Mocla extends OOM{
        function __construct(){
            $this->model_name = "mocla";
            //$this->private = ["password"];
        }
    }
    $Mocla = new Mocla(); // Optional, but cool.
?>