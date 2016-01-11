//
//  PQABaseViewController.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/11/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit

class PQABaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
        self .setUpNavigationBar()
    }
    
    /*
    // MARK: - Navigation
    */

    func setUpNavigationBar() {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = colorWithHexString("ff86a1")
        nav?.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        let rightButton: UIButton = UIButton()
        
        rightButton.frame = CGRect.init(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        rightButton.setImage(UIImage(named: "IconSetting"), forState: UIControlState.Normal)
        
        let rightMenuBar = UIBarButtonItem()
        rightMenuBar.customView = rightButton
        
        let negativeSpacer = UIBarButtonItem()
        negativeSpacer.width = 10.0
        
        self.navigationItem .setRightBarButtonItems([negativeSpacer, rightMenuBar], animated: true)
    }
    
    /*
    // MARK: - Custom TabBar
    */
    
    func addCenterButtonWithImage(buttonImage: UIImage, highlightImage: UIImage?) {
        //
    }
}
