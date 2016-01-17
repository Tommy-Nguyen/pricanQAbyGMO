//
//  PQAHomeDetailViewController.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/15/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit

class PQAHomeDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewContanit: UIView!
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    
    @IBOutlet weak var numberComment: UIImageView!
    @IBOutlet weak var numberLike: UIImageView!
    @IBOutlet weak var numberWatch: UIImageView!
//    let objConsultation : Consultation = Consultation(dict: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.scrollView.backgroundColor = UIColor .lightGrayColor()
        self.viewContanit.backgroundColor = UIColor .whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func initializeView() {
        //
    }
}
