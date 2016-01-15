//
//  Consultation.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/15/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit

class Consultation: NSObject {
    
    var is_watch    : String = ""
    var created_at  : String = ""
    var user_id     : String = ""
    var is_like     : String = ""

    var consultation_id : String = ""
    var is_commented    : String = ""
    var new_flag        : String = ""
    var comment_count   : String = ""
    
    var like_count      : String = ""
    var has_best_answer : String = ""
    var is_watched      : String = ""
    var watch_count     : String = ""
    var anonymous_no    : String = ""
    
    var nickname    : String = ""
    var age         : String = ""
    var categories  : NSArray = []

    var objDescription : String = ""
//    var thumbnail_urls : [String : String] = []
    
    init(JSONString: String) {
        super.init()
        
        var error: NSError?
        
//        let JSONData = JSONString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
//        
//        let JSONDictionary: Dictionary = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: &error) as NSDictionary
//        
//        // Loop
//        for (key, value) in JSONDictionary {
//            let keyName = key as String
//            let keyValue: String = value as String
//            
//            // If property exists
//            if (self.respondsToSelector(NSSelectorFromString(keyName))) {
//                self.setValue(keyValue, forKey: keyName)
//            }
//        }
    }
}
