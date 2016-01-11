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

        // Do any additional setup after loading the view.
        self .createTabBarView()
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
        pqaHomeVC.view.backgroundColor = UIColor .redColor();
        
        let pqaSearchVC = PQABaseViewController() as PQABaseViewController
        pqaSearchVC.view.backgroundColor = UIColor .blueColor();

        let pqaInformationVC = PQABaseViewController() as PQABaseViewController
        pqaInformationVC.view.backgroundColor = UIColor .grayColor();

        let pqaMyPageVC = PQABaseViewController() as PQABaseViewController
        pqaMyPageVC.view.backgroundColor = UIColor .greenColor();

        let pqaCenterView = PQAHomeViewController() as PQAHomeViewController
        pqaCenterView.view.backgroundColor = UIColor .greenColor();

        let pqaCenterNav: UINavigationController = UINavigationController.init(rootViewController: pqaCenterView)
        pqaCenterNav.navigationBarHidden = false
        pqaCenterNav.tabBarItem.tag = 2
        
        let pqaHomeNav: UINavigationController = UINavigationController.init(rootViewController: pqaHomeVC)
        pqaHomeNav.navigationBarHidden = false
        pqaHomeNav.tabBarItem.tag = 0

        let pqaSearchNav: UINavigationController = UINavigationController.init(rootViewController: pqaSearchVC)
        pqaSearchNav.navigationBarHidden = false
        pqaSearchNav.tabBarItem.tag = 1
        
        let pqaInformationNav: UINavigationController = UINavigationController.init(rootViewController: pqaInformationVC)
        pqaInformationNav.navigationBarHidden = false
        pqaInformationNav.tabBarItem.tag = 3
        
        let pqaMyPageNav: UINavigationController = UINavigationController.init(rootViewController: pqaMyPageVC)
        pqaMyPageNav.navigationBarHidden = false
        pqaMyPageNav.tabBarItem.tag = 4
        
        self.viewControllers = [pqaHomeNav, pqaSearchNav, pqaCenterNav, pqaInformationNav, pqaMyPageNav]
    }
}
