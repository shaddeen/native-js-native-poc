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
  
  //MARK: UIViewController life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
        
    let bridge = RCTBridge(delegate: self, launchOptions: nil)

    let rootView = RCTRootView.init(bridge: bridge, moduleName: "NativeJSPOC", initialProperties: nil)
    
    self.view.insertReactSubview(rootView, atIndex: 0)
    
    rootView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subview]-0-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics:nil, views:["subview":rootView]))
    self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[subview]-0-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics:nil, views:["subview":rootView]))

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
    self.viewControllerModule.getData("someType") { (success: Bool) -> Void in
        print("success " + String(success))
    }
  }
  
}