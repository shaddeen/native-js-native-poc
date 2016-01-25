import Foundation

@objc(DataModule)
class DataModule : NSObject {
  var bridge: RCTBridge!
  var model: ModelProtocol?
  var completion:((success: Bool) -> Void)!
  
  var methodQueue: dispatch_queue_t {
    get {
      return dispatch_get_main_queue()
    }
  }
  
  convenience init(model: ModelProtocol) {
    self.init()
    self.model = model
  }
  
  @objc func returnWithData(data: [String : AnyObject]) -> Void {
    processData(data)
  }
  
  @objc func getData(dataType: String!, completion: ((Bool)->Void)!) {
    self.completion = completion
    self.bridge.eventDispatcher.sendDeviceEventWithName("getData", body: ["dataType": dataType])
    
    //self.bridge.enqueueJSCall("NativeJSPOC.nativeButtonPressedResponder", args: [""])
    //See ReactNativeEventEmitter.js

  }
  
  func processData(data: [String : AnyObject]) {
    model?.configureWithData(data)
    self.completion(success: true)
  }
}