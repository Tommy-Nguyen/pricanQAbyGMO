//
//  PQADashboardViewController.swift
//  PricanQAbyGMO
//
//  Created by Nguyen Minh on 1/11/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit

class PQADashboardViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self .createTabBarView()
        
        UITabBar.appearance().backgroundImage = UIImage(named: "tabBar1")
        self.tabBar.setValue(true, forKey: "_hidesShadow")
        self .addCenterButtonWithImage(UIImage(named: "IconTabBar")!, highlightImage: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func createTabBarView() {
        let pqaHomeVC = PQABaseViewController() as PQABaseViewController
        pqaHomeVC.view.backgroundColor = UIColor .whiteColor();
        
        let pqaSearchVC = PQABaseViewController() as PQABaseViewController
        pqaSearchVC.view.backgroundColor = UIColor .blueColor();

        let pqaInformationVC = PQABaseViewController() as PQABaseViewController
        pqaInformationVC.view.backgroundColor = UIColor .grayColor();

        let pqaMyPageVC = PQABaseViewController() as PQABaseViewController
        pqaMyPageVC.view.backgroundColor = UIColor .greenColor();

        let pqaCenterView = PQAHomeViewController() as PQAHomeViewController
        
        let pqaCenterNav: UINavigationController = UINavigationController.init(rootViewController: pqaCenterView)
        pqaCenterNav.navigationBarHidden = false
        let iconCenter = UITabBarItem(title: "", image: UIImage(named: "IconTabBar")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "IconTabBar")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        pqaCenterNav.tabBarItem = iconCenter
        pqaCenterNav.tabBarItem.tag = 2

        let pqaHomeNav: UINavigationController = UINavigationController.init(rootViewController: pqaHomeVC)
        pqaHomeNav.navigationBarHidden = false
        let iconHome = UITabBarItem(title: "Home", image: UIImage(named: "IconTabBarHome")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "IconTabBarHome-ac")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        pqaHomeNav.tabBarItem = iconHome
        pqaHomeNav.tabBarItem.tag = 0

        let pqaSearchNav: UINavigationController = UINavigationController.init(rootViewController: pqaSearchVC)
        pqaSearchNav.navigationBarHidden = false
        let iconSearch = UITabBarItem(title: "Search", image: UIImage(named: "IconTabBarS")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "IconTabBarS-ac")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        pqaSearchNav.tabBarItem = iconSearch
        pqaSearchNav.tabBarItem.tag = 1
        
        let pqaInformationNav: UINavigationController = UINavigationController.init(rootViewController: pqaInformationVC)
        pqaInformationNav.navigationBarHidden = false
        let iconInfo = UITabBarItem(title: "Information", image: UIImage(named: "IconTabBarInfo")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "IconTabBarInfo-ac")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        pqaInformationNav.tabBarItem = iconInfo
        pqaInformationNav.tabBarItem.tag = 3
        
        let pqaMyPageNav: UINavigationController = UINavigationController.init(rootViewController: pqaMyPageVC)
        pqaMyPageNav.navigationBarHidden = false
        let iconMypage = UITabBarItem(title: "My Page", image: UIImage(named: "IconTabBarMP")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "IconTabBarMP-ac")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        pqaMyPageNav.tabBarItem = iconMypage
        pqaMyPageNav.tabBarItem.tag = 4
        
        self.viewControllers = [pqaHomeNav, pqaSearchNav, pqaCenterNav, pqaInformationNav, pqaMyPageNav]
    }
    
    // MARK: - Add Center TabBar
    func addCenterButtonWithImage(buttonImage: UIImage, highlightImage: UIImage?) {
        let buttonCenter = UIButton()
        
        buttonCenter.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height)
        buttonCenter.setBackgroundImage(buttonImage, forState: UIControlState.Normal)
        buttonCenter.setBackgroundImage(highlightImage, forState: UIControlState.Highlighted)
        buttonCenter .addTarget(self, action: "buttonEvent", forControlEvents: UIControlEvents.TouchUpInside)
        
        DLog("\(buttonImage.size.height)-- \(self.tabBar)")
        
        let heightDifference = buttonImage.size.height - 50.0
        
        if heightDifference < 0 {
            buttonCenter.center = (self.tabBar.center)
        }
        else {
            var center: CGPoint = self.tabBar.center
            center.y = center.y - self.tabBar.frame.origin.y - heightDifference/2.0
            buttonCenter.center = center
        }
        
        self.tabBar .addSubview(buttonCenter)
    }
    
    func buttonEvent() {
        let appDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
        let viewController = appDelegate.window!.rootViewController as! PQADashboardViewController
        viewController.selectedIndex = 2
    }
}
