//
//  Macros.swift
//  PHR_Swift
//
//  Created by DEV-MinhNN on 12/24/15.
//  Copyright © 2015 DEV-MinhNN. All rights reserved.
//

import Foundation
import UIKit

/*
// Define UIColor
*/

func PHRCOLORGRAY() -> UIColor {
    return RGBColor(137, g: 137, b: 137)
}

func RGBColor(r: Int, g: Int, b: Int) -> UIColor {
    return UIColor(
        red: CGFloat(r) / 255.0,
        green: CGFloat(g) / 255.0,
        blue: CGFloat(b) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func colorWithHexString (hex:String) -> UIColor {
    var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
    
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substringFromIndex(1)
    }
    
    if (cString.characters.count != 6) {
        return UIColor.grayColor()
    }
    
    let rString = (cString as NSString).substringToIndex(2)
    let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
    let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    NSScanner(string: rString).scanHexInt(&r)
    NSScanner(string: gString).scanHexInt(&g)
    NSScanner(string: bString).scanHexInt(&b)
    
    
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
}

// DLog and aLog macros to abbreviate NSLog.
// Use like this:
//
//   DLog("Log this!")
//

#if DEBUG
    func dLog(message: String, filename: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        NSLog("[\(filename.lastPathComponent):\(line)] \(function) - \(message)")
    }
    
    func uLog(message: String, filename: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        let alertView = UIAlertView(title: "[\(filename.lastPathComponent):\(line)]", message: "\(function) - \(message)",  delegate:nil, cancelButtonTitle:"OK")
        alertView.show()
    }
    
#else
    func dLog(message: String, filename: NSString = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        NSLog("[\(filename.lastPathComponent):\(line)] \(function) - \(message)")
    }
    
    func uLog(message: String, filename: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) { }
    
#endif

func DLog(message: String, filename: NSString = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    NSLog("[\(filename.lastPathComponent):\(line)] \(function) - \(message)")
}
