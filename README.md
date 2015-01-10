# Chat client

### Proposed technologies
* ES6 JavaScript. Transformed to ES5 for browser-code
* [React](http://facebook.github.io/react/) For UI components
* [Jest](https://facebook.github.io/jest/) for testing UI components
* [Flux](https://facebook.github.io/flux/) software architecture on both frontend and backend
* [Flow + flotate](https://github.com/jareware/flotate) for type annotations
* [Stylus](http://learnboost.github.io/stylus) files to CSS
* [Jade](http://jade-lang.com) templates
* [Koa.js](http://koajs.com/) for web framework
* (?) Database

## Proposed architecture
* [Flux](https://facebook.github.io/flux/) or something similar
* Isomorphic components
  * can be run on both frontend and backend
* Modular structure
* Extendable with modules and custom components
* Adapters for usage with multiple services (e.g IRC)

## Getting things up and running
- Install [Node.js](http://nodejs.org) >= 0.11.13

```
 git clone git@github.com:leonidas/gulp-project-template.git <your project name>
 cd <your project name>
 npm install
 npm start
 open http://localhost:9001 in your browser
````
### Enable LiveReload
Install [LiveReload for Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en)

## CLI Commands
* npm install
    * Installs server-side dependencies from NPM and client-side dependencies from Bower
* npm start
    * Compiles your files, starts watching files for changes, serves static files to port 9001
* npm run build
    * Builds everything

Minification, uglification and other tasks you're expected to run before deploying your product can be made by running the build command with env variable NODE_ENV set to "production"

    NODE_ENV=production npm run build

## Development guidelines
* **client** - directory should be dedicated only to compiled/copied files from **src** - directory.
  It should be possible to delete directory completely and after **npm start** or **npm run build** everything should be as they were before the deletion.
* All backend dependencies should be installed with **npm**. Browser dependencies should be installed with **bower** or with **npm**.

## Resources
https://medium.com/node-js-javascript/working-without-frameworks-part-1-b948f281f782
https://github.com/JustinDrake/node-es6-examples
