//
//  UIUtils.swift
//  PHR_Swift
//
//  Created by DEV-MinhNN on 12/24/15.
//  Copyright © 2015 DEV-MinhNN. All rights reserved.
//

import UIKit

class UIUtils: NSObject {
    
    class func showFailedAlertWithTitle(titleAlert: String, messageAlert: String) -> UIAlertController {
        // create the alert
        let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
        }

        return alert
    }
}
