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
                
                let arrayResponse : NSMutableArray = []

                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                        
                    do {
                        if let jsonResult = try NSJSONSerialization.JSONObjectWithData(response.data!, options: []) as? NSDictionary {
                            print(jsonResult)
                        }
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                    
                    if let dict = JSON as? [String: AnyObject] {
                        for key in ["cards"] {
                            if let dictValue = dict[key] {
                                for var i = 1 ; i < dictValue.count ; i++ {
                                    let objSub = dictValue .objectAtIndex(i) as! [String: AnyObject]
                                    for key2 in ["consultation"] {
                                        if let conDictionary = objSub[key2] {
                                            arrayResponse .addObject(conDictionary)
                                        }
                                    }
                                }
                            } else {
                                print("Key '\(key)' not found")
                            }
                        }
                    }
                }
                complitionHandler(responseObect: arrayResponse)
        }
    }
    
    /*
    // MARK - HUD Progress
    */
    
    func showAnimatedProgressHUD(title : String) {
        PKHUD.sharedHUD.contentView = PKHUDStatusProgressView(title: "", subtitle: title)
        PKHUD.sharedHUD.show()
    }
    
    func hideAnimatedProgressHUD(){
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        PKHUD.sharedHUD.hide()
    }
}
