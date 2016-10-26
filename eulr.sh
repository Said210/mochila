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
esac
