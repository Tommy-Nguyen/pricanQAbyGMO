//
//  FontUtils.swift
//  PHR.Swift
//
//  Created by DEV-MinhNN on 12/29/15.
//  Copyright © 2015 DEV-MinhNN. All rights reserved.
//

import UIKit

class FontUtils: NSObject {

    class func montserratRegularWithSize(size: CGFloat) -> UIFont {
        let font = UIFont(name: "Montserrat-Regular", size: size)! as UIFont
        return font
    }
    
    class func montserratBlackWithSize(size: CGFloat) -> UIFont {
        let font = UIFont(name: "Montserrat-Black", size: size)! as UIFont
        return font
    }
    
    class func montserratBoldWithSize(size: CGFloat) -> UIFont {
        let font = UIFont(name: "Montserrat-Bold", size: size)! as UIFont
        return font
    }
}
