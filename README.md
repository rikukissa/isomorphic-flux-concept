# Example of an isomorphic [Flux](https://facebook.github.io/flux/)+[React](http://facebook.github.io/react/) application
Browser & backend all using the same code and using the same actions through a dispatcher to sync their state.


![Demo](https://raw.githubusercontent.com/rikukissa/isomorphic-flux-concept/master/meta/demo.gif)

* Both browser & server share [the same code](https://github.com/rikukissa/isomorphic-flux-
concept/tree/master/src/node_modules).
* Application is rendered to browsers server-side at first.
* Dispatcher is implemented so that every browser and the server receive the same actions through a websocket connection. This is done by [broadcasting all actions the server receives to every browser](https://github.com/rikukissa/isomorphic-flux-concept/blob/master/src/node_modules/dispatcher/index.js#L35-L37) (excluding the one where the action originated from). All browsers listen to these actions [and dispatching them with their own instance of the dispatcher](https://github.com/rikukissa/isomorphic-flux-concept/blob/master/src/node_modules/dispatcher/index.js#L32-L38)

![Flowchart](https://raw.githubusercontent.com/rikukissa/isomorphic-flux-concept/master/meta/websocket-flow.png)

## Why?
I wanted to see what's the extent of isomorphism possible to be accomplished with this architecture. I was expecting to hit a stone wall at some point and to realize that this can't be done for some obvious reason. It was a positive surprise to notice that this is actually possible, the implementation is fairly simple (although a bit mind bending) and the amount of environment conditionals remained almost nonexistent.

I have no idea if this could be applied to a real-world architecture and would definitely like to hear ideas about how it could be done, could or should I change something in the current implementation and what kind of applications would benefit from this kind of structure.


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
