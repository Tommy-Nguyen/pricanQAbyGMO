//
//  NetworkManager.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/14/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD
import SwiftyJSON

class NetworkManager: NSObject {
    
    class var sharedManager: NetworkManager {
        struct Singleton {
            static var once_token: dispatch_once_t = 0
            static var sharedClient: NetworkManager? = nil
        }
        
        dispatch_once(&Singleton.once_token) { () -> Void in
            Singleton.sharedClient = NetworkManager()
        }
        return Singleton.sharedClient!
    }
    
    func getListDataFromServer(complitionHandler:(responseObect: NSMutableArray) -> Void) {
        Alamofire.request(.GET, kBaseURL)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                var arrayResponse : NSMutableArray = []
                
                let JSONDATA = JSON(response.result.value!)
                arrayResponse = self .parseJSON(JSONDATA)
                
//                if JSONDATA {
//                    print("JSON: \(JSONDATA)")
//                    
//                    //                    do {
//                    //                        if let jsonResult = try NSJSONSerialization.JSONObjectWithData(response.data!, options: []) as? NSDictionary {
//                    //                            print(jsonResult)
//                    //                        }
//                    //                    } catch let error as NSError {
//                    //                        print(error.localizedDescription)
//                    //                    }
//                    
//                    if let dict = JSONDATA as? [String: AnyObject] {
//                        for key in ["cards"] {
//                            if let dictValue = dict[key] {
//                                for var i = 1 ; i < dictValue.count ; i++ {
//                                    let objSub = dictValue .objectAtIndex(i) as! [String: AnyObject]
//                                    for key2 in ["consultation"] {
//                                        if let conDictionary = objSub[key2] {
//                                            arrayResponse .addObject(conDictionary)
//                                        }
//                                    }
//                                }
//                            } else {
//                                print("Key '\(key)' not found")
//                            }
//                        }
//                    }
//                }
                complitionHandler(responseObect: arrayResponse)
        }
    }
    
    func parseJSON(json: JSON) -> (NSMutableArray) {
        let list: NSMutableArray = []

        for result in json["cards"].arrayValue {
            let consultationJSON:JSON = result["consultation"]
            
            if consultationJSON.null == nil {
                let objConsultation:Consultation = Consultation(json: consultationJSON)
                list .addObject(objConsultation)
            }
        }
        return list
    }
    
    // MARK: - HUD Progress
    
    func showAnimatedProgressHUD(title : String) {
        PKHUD.sharedHUD.contentView = PKHUDStatusProgressView(title: "", subtitle: title)
        PKHUD.sharedHUD.show()
    }
    
    func hideAnimatedProgressHUD(){
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        PKHUD.sharedHUD.hide()
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
}
