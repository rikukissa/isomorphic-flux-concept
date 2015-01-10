'use strict';

var koa = require('koa'),
    route = require('koa-route'),
    React = require('react'),
    views = require('co-views'),
    path = require('path');

require('node-jsx').install();

var environment = process.env.NODE_ENV || 'development';

var dir = {
  views: path.join(__dirname, '../', 'views'),
  client: path.join(__dirname, '../../', 'client')
};

var app = koa();
var render = views(dir.views, { ext: 'jade' });

if(environment === 'development') {
  app.use(require('koa-static')(dir.client));
}

var App = require('components/App.jsx');

app.use(route.get('/', function*() {
  this.body = yield render('index', {
    reactApp: React.renderToString(App())
  });
}));

app.listen(9001);
