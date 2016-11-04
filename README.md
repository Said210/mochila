# mochila
Chila Mochila

HEAL THE WORLD
MAKE IT A BETTER PLACE
FOR YOU AND FOR ME AND THE ENTIRE HUMAN RACE
THERE ARE PEOPLE DYINGADSPFOKAPODKFPAODFKPOADKFSPADOFK
LALALALALALALA
:v
---------------
# REAL TALK, bro.

### ¿Como lo hace?
El funcionamiento de mocla es izi pizi, se base en el MVC. Tienes el siguiente árbol de carpetas:
- assets
    - assets / js               => JS compilado
    - assets / css              => css compilado
    - assets / img              => Imágenes
- dev
    - dev / ts                  => TypeScript
    - dev / sass                => Sass
- php   
    - php / model               => Todos los objetos de la base 
        - php / model / oom     => Archivos de OOM
    - php / controller          => Todos los archivos del controlador
- vendor
- views
    - views / templates
    - views / *
    
![EASY](https://media.giphy.com/media/zG6MKhlBxIloc/giphy.gif)

¡Muy bien! ahora que dominas las artes del directorio estás listo para empezar con las rutas.

Como en mocla nos gusta ser guapetones estamos usando un un gestor de rutas que nos permite hacer rutas bonitas y poder aplicar el MVC en PHP como papi Díos Zac Efron nos manda. **Las rutas se encuentran dentro de la raiz en index.php** y se ponen así
```php
$router->map( 'GET', '/', function() {
	//[INSERTA QUE HACER CUANDO SE HACE UN REQUEST EN GET A /]
	render("views/index.php");
}, 'home');
```
_Para mas detalles de rutas busca altorouter_ (http://bfy.tw/8ZkR)

Y ya, es todo lo que debes saber, casi.


## Make mocla great again
