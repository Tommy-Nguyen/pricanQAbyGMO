//
//  NetworkManager.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/14/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit
import Alamofire
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
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
}
