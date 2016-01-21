//
//  Consultation.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/15/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit
import SwiftyJSON

class Consultation: NSObject {
    
    var objDes      : String = ""
    var nickname    : String = ""
    var urlImage    : String = ""

    var age         : Int = 0
    
    var watch_count     : Int = 0
    var comment_count   : Int = 0
    var like_count      : Int = 0
    
    var has_best_answer : String = ""
    var is_watched      : String = ""
    var consultation_id : String = ""
    var is_commented    : String = ""
    var new_flag        : String = ""
    var categories  : NSArray = []
    var anonymous_no    : String = ""
    var is_watch    : Bool = false
    var created_at  : String = ""
    var user_id     : String = ""
    var is_like     : String = ""
    
    init(json: JSON) {
        
        if (json.null != nil) {
            return
        }
        
        self.urlImage = json["thumbnail_urls"]["default"].stringValue
        self.age      = json["age"].int!
        
        self.objDes         = json["description"].string!
        self.nickname       = json["nickname"].string!

        self.like_count     = json["like_count"].int!
        self.watch_count    = json["watch_count"].int!
        self.comment_count  = json["comment_count"].int!
    }
}
