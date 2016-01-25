//
//  NativeViewController.swift
//  NativeJSPOC
//
//  Created by Shad on 20/01/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Foundation

class ViewController: UIViewController, RCTBridgeDelegate {
  
  var viewControllerModule: DataModule!
  @IBOutlet var nativeButton: UIButton!
  var bridge: RCTBridge!
  
  //MARK: UIViewController life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
        
    bridge = RCTBridge(delegate: self, launchOptions: nil)
    
  }
  
  //MARK: RCTBridge delegate methods
  
  func extraModulesForBridge(bridge: RCTBridge!) -> [AnyObject]! {
    self.viewControllerModule = DataModule()
    self.viewControllerModule.bridge = bridge
    return [self.viewControllerModule]
  }
  
  func sourceURLForBridge(bridge: RCTBridge!) -> NSURL! {
    return NSURL(string: "http://localhost:8081/index.ios.bundle?platform=ios&dev=true")
  }
  
  //MARK: Action methods
  
  @IBAction func pressedNativeButton() {
    self.viewControllerModule.getData("someType") { () -> Void in
      print("success 1")
    }
    self.viewControllerModule.getData("someType") { () -> Void in
      print("success 2")
    }
    self.viewControllerModule.getData("someType") { () -> Void in
      print("success 3")
    }
    self.viewControllerModule.getData("someType") { () -> Void in
      print("success 4")
    }
  }
  
}