# Example of an isomorphic [Flux](https://facebook.github.io/flux/)+[React](http://facebook.github.io/react/) application

![Flowchart](https://raw.githubusercontent.com/rikukissa/isomorphic-flux-concept/master/meta/websocket-flow.png)

* Both browser & server share [the same code](https://github.com/rikukissa/isomorphic-flux-concept/tree/master/src/node_modules).
* Application is rendered to browsers server-side at first.
* Client and server share the same dispatcher so that browser is constantly in sync with the server.

## Getting things up and running
- Install [Node.js](http://nodejs.org) >= 0.11.13

```
 git clone git@github.com:rikukissa/isomorphic-flux-concept.git
 cd isomorphic-flux-concept
 npm install
 npm start
 open http://localhost:9001 in your browser
````

## Resources
https://github.com/facebook/react/tree/master/examples/server-rendering
https://medium.com/node-js-javascript/working-without-frameworks-part-1-b948f281f782
