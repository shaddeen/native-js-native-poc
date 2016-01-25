'use strict';

class DataModule {

  getData() {
    console.log('DataModule.getData')
  }

}

var BatchedBridge = require('BatchedBridge');
var data = new DataModule();

BatchedBridge.registerCallableModule(
  'DataModule',
  data
);

module.exports = data;
