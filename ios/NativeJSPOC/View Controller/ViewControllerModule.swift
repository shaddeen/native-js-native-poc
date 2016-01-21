import Foundation

@objc(ViewControllerModule)
class ViewControllerModule : NSObject {
  var bridge: RCTBridge!
  
  var methodQueue: dispatch_queue_t {
    get {
      return dispatch_get_main_queue()
    }
  }
  
  @objc func sendSomethingBack(data: [String: String]) -> Void {
    self.performSelector(Selector(data["selector"]!))
  }
  
  @objc func pressedButton() {
    self.bridge.eventDispatcher.sendDeviceEventWithName("pressedButton", body: ["selector": "someMethod"])
  }
  
  func someMethod() {
    print("invoked someMethod");
  }
  
}