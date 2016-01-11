//
//  ExtensionClass.swift
//  PHR_Swift
//
//  Created by DEV-MinhNN on 12/28/15.
//  Copyright © 2015 DEV-MinhNN. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func validateEmail(text: String) -> Bool {
        let stricterFilterString:String = "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,4})$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", stricterFilterString)
        
        return emailPredicate.evaluateWithObject(text)
    }
}