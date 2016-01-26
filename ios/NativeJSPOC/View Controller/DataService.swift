//
//  NativeViewController.swift
//  NativeJSPOC
//
//  Created by Shad on 20/01/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Foundation

typealias DataServiceClosure = () -> Void

class DataService: NSObject, RCTBridgeDelegate {
  
  var dataModule: DataModule!
  var bridge: RCTBridge!
  
  override init() {
    super.init()
    bridge = RCTBridge(delegate: self, launchOptions: nil)
  }
  
  //MARK: RCTBridge delegate methods
  
  func extraModulesForBridge(bridge: RCTBridge!) -> [AnyObject]! {
    self.dataModule = DataModule()
    self.dataModule.bridge = bridge
    return [self.dataModule]
  }
  
  func sourceURLForBridge(bridge: RCTBridge!) -> NSURL! {
    return NSURL(string: "http://localhost:8081/index.ios.bundle?platform=ios&dev=true")
  }
  
  //MARK: Public methods
  
  func getData(dataType: String, completion: DataServiceClosure) {
    self.dataModule.getData(dataType, completion: completion)
  }
}
