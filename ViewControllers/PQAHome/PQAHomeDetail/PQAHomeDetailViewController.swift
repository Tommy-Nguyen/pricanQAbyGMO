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
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    
    @IBOutlet weak var userDescription: UITextView!
    
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var watchCount: UILabel!
    
    @IBOutlet weak var viewLike: UIView!
    @IBOutlet weak var viewComment: UIView!
    @IBOutlet weak var viewWatch: UIView!
    
    var objConsultation : Consultation = Consultation(json: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.avatar.layer.cornerRadius = self.avatar.frame.size.width / 2
        self.scrollView.backgroundColor = RGBColor(239, g: 239, b: 244)
        
        UIBarButtonItem .appearance() .setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: 0, vertical: -60), forBarMetrics: UIBarMetrics.Default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self .fillDataToDetailView()
    }
    
    /*
    // MARK: - Navigation
    */

    func fillDataToDetailView() {
        let url = NSURL(string: "\(self.objConsultation.urlImage)")

        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        NetworkManager .sharedManager .getDataFromUrl(url!) { (data, response, error)  in
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    guard let data = data where error == nil else { return }
                    self.avatar.image = UIImage(data: data)
                }
            }
        }
        
        self.lbName.text = self.objConsultation.nickname
        self.lbAge.text = "\(self.objConsultation.age)"
        self.userDescription.text = "\(self.objConsultation.objDes)"
        
        self.likeCount.text = "\(self.objConsultation.like_count)"
        self.commentCount.text = "\(self.objConsultation.comment_count)"
        self.watchCount.text = "\(self.objConsultation.watch_count)"
        
        let fixedWidth = self.userDescription.frame.size.width
        self.userDescription.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = self.userDescription.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = self.userDescription.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        self.userDescription.frame = newFrame;
        
        self .setOriginYToView(self.viewLike, andFloatY: self.userDescription.frame.origin.y + self.userDescription.frame.size.height)
        self .setOriginYToView(self.viewComment, andFloatY: self.userDescription.frame.origin.y + self.userDescription.frame.size.height)
        self .setOriginYToView(self.viewWatch, andFloatY: self.userDescription.frame.origin.y + self.userDescription.frame.size.height)
        
        var sizeOfContent = 0 as CGFloat
        let subViewLast = self.viewContanit.subviews.last! as UIView
        let wd = subViewLast.frame.origin.y as CGFloat
        let ht = subViewLast.frame.size.height as CGFloat
        sizeOfContent = wd + ht + 10
        
        self.scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, sizeOfContent)

    }
    
    func setOriginYToView(theView : UIView , andFloatY: CGFloat) {
        theView.frame = CGRectMake(theView.frame.origin.x, andFloatY, theView.frame.size.width, theView.frame.size.height)
    }
}
