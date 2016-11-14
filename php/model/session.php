<?php
    require_once 'oom/OOM.php';

    class session extends OOM{
        function __construct(){
            $this->model_name = "session";
            $this->private = [];
        }
    }
    $session = new session(); // Optional, but cool.
    ?>
