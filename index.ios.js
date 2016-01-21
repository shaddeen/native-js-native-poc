/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

import { ViewControllerModule as NativeModule } from 'NativeModules';

import React, {
  AppRegistry,
  Component,
  DeviceEventEmitter,
  View
} from 'react-native';

class NativeJSPOC extends Component {

  constructor() {
    super();
    DeviceEventEmitter.addListener('pressedButton', (e: Event) => this.nativeButtonPressedResponder(e));
  }

  nativeButtonPressedResponder (e: Event) {
    var selector = e.selector;
    NativeModule.sendSomethingBack({selector: selector});
  }

  render() {
    return (<View />);
  }
}

AppRegistry.registerComponent('NativeJSPOC', () => NativeJSPOC);
