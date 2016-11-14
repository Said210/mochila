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
        git commit -m "$2"
        git push origin master
    ;;

    g )
        name=$2
        name="$(tr '[:lower:]' '[:upper:]' <<< ${name:0:1})${name:1}"
        cap="$(tr '[:lower:]' '[:upper:]' <<< ${name:0})"
        echo "<?php
    require_once 'oom/OOM.php';

    class $name extends OOM{
        function __construct(){
            \$this->model_name = \"$2\";
            \$this->private = [];
        }
    }
    \$$cap = new $name(); // Optional, but cool.
    ?>" > php/model/$2.php

        echo "<?php
    require_once('php/model/$2.php');
    require_once('helpers.php');
    require_once('errors.php');
    session_start();
    /**
    * $nameController class
    */
    class $nameController{}?>" > php/controller/$2_controller.php

        mkdir views/$2

    ;;
esac
