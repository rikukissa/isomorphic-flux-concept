'use strict';
var React = require('react');
var App = require('components/App');

var appStore = require('stores/appStore');
appStore.setData(window.STATE.appStore);

React.render(<App />, document.body);


