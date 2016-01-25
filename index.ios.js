/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

import DataModule from './DataModule';
import { DataModule as NativeModule } from 'NativeModules';

import React, {
  AppRegistry,
  Component,
  DeviceEventEmitter,
  View
} from 'react-native';

class NativeJSPOC extends Component {

  constructor() {
    super();
    DeviceEventEmitter.addListener('getData', (e: Event) => this.nativeButtonPressedResponder(e));
  }

  nativeButtonPressedResponder (e: Event) {
    var selector = e.selector;
    NativeModule.returnWithData({selector: selector});
  }

  render() {
    return (<View />);
  }
}

AppRegistry.registerComponent('NativeJSPOC', () => NativeJSPOC);
