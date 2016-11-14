case "$1" in
    sass )
        echo "Sass compiler starting..."
        sass --watch dev/sass:assets/css
    ;;
    ts )
        echo "Typescript compiler starting..."
        tsc -w --outFile assets/js/app.js dev/ts/app --module commonjs
    ;;
    start )
        echo "Starting..."
        php -S 0.0.0.0:8000
    ;;

    fuck )
        ./eulr.sh sass &
        ./eulr.sh ts  &
        ./eulr.sh start
    ;;

    commit )
        git add .
        git commit -m $2
        git push origin master
    ;;

    g )
        echo "<?php
    require_once 'oom/OOM.php';

    class $2 extends OOM{
        function __construct(){
            $this->model_name = $2;
            $this->private = [];
        }
    }
    $2 = new $2(); // Optional, but cool.
    ?>" > php/model/$2.php

        echo "<?php
    require_once('php/model/$2.php');
    require_once('helpers.php');
    require_once('errors.php');
    session_start();
    /**
    * $2Controller class
    */
    class $2Controller{}?>" > php/controller/$2.php

        mkdir views/$2

    ;;
esac
