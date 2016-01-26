//
//  NativeViewController.swift
//  NativeJSPOC
//
//  Created by Shad on 20/01/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Foundation

class ViewController: UIViewController {
  
  var dataService: DataService!
  
  //MARK: UIViewController life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.dataService = DataService()
  }
  
  //MARK: Action methods

  @IBAction func pressedNativeButton() {
    self.dataService.getData("someType") { () -> Void in
      print("success 1")
    }
    self.dataService.getData("someType") { () -> Void in
      print("success 2")
    }
    self.dataService.getData("someType") { () -> Void in
      print("success 3")
    }
  }
  
}