<?php
    require_once 'oom/OOM.php';

    class Session extends OOM{
        function __construct(){
            $this->model_name = "session";
            $this->private = [];
        }
    }
    $SESSION = new Session(); // Optional, but cool.
    ?>
