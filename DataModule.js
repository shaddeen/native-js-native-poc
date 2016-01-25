'use strict';

import { DataModule as NativeModule } from 'NativeModules';

class DataModule {

  getData(requestID, dataType) {
    console.log('DataModule.getData');
    console.log(requestID["requestID"]);
    console.log(dataType["dataType"]);
    NativeModule.returnWithData({"requestID": requestID["requestID"], "dataType": dataType["dataType"]});
  }

}

var BatchedBridge = require('BatchedBridge');
var data = new DataModule();

BatchedBridge.registerCallableModule(
  'DataModule',
  data
);

module.exports = data;
