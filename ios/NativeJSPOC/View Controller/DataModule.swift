import Foundation

typealias DataClosure = () -> Void

@objc(DataModule)
class DataModule : NSObject {
  var bridge: RCTBridge!
  var model: ModelProtocol?
  var requests: Array<Any>!
  var requestID: Int = 0

  var methodQueue: dispatch_queue_t {
    get {
      return dispatch_get_main_queue()
    }
  }
  
  override init () {
    self.requests = Array()
  }
  
  convenience init(model: ModelProtocol) {
    self.init()
    self.model = model
  }
  
  @objc func returnWithData(data: [String : AnyObject]) -> Void {
    processData(data)
  }
  
  @objc func getData(dataType: String!, completion: DataClosure!) {
    requestID++
    
    let data: [String: Any] = ["requestID": requestID, "completion": completion]
    requests.append(data)
    
    self.bridge.enqueueJSCall("DataModule.getData", args: [["requestID": requestID], ["dataType": dataType]])
  }
  
  func processData(data: [String : AnyObject]) {
    guard let id = data["requestID"] as? Int else {
      return;
    }
    
    let result = requests.filter { (Object) -> Bool in
      guard let requestObject = Object as? [String: Any] else {
        return false
      }
      guard let requestID = requestObject["requestID"] as? Int else {
        return false
      }
      return requestID == id
    }
    
    guard let dictionary = result[0] as? [String: Any] else {
      return;
    }
    
    guard let closure = dictionary["completion"] as? DataClosure else {
      return
    }
    
    closure()
  }
}