//
//  PQACustomHomeTableViewCell.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/15/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit

class PQACustomHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var viewContaint: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var numberLike: UILabel!
    @IBOutlet weak var numberComment: UILabel!
    @IBOutlet weak var numberWatch: UILabel!
    @IBOutlet weak var btnActionDummy: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.viewContaint.layer.borderWidth = 1.0
        self.viewContaint.layer.borderColor = UIColor .lightGrayColor().CGColor
        self.avatar.layer.cornerRadius = self.avatar.frame.size.height / 2
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillDataToCell(objConsultation: Consultation) {
        let url = NSURL(string: "\(objConsultation.urlImage)")
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        NetworkManager .sharedManager .getDataFromUrl(url!) { (data, response, error)  in
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    guard let data = data where error == nil else { return }
                    self.avatar.image = UIImage(data: data)
                }
            }
        }
        
        self.name.text = objConsultation.nickname
        self.age.text = "\(objConsultation.age)"
        self.userDescription.text = objConsultation.objDes
        
        self.numberLike.text = "\(objConsultation.like_count)"
        self.numberComment.text = "\(objConsultation.comment_count)"
        self.numberWatch.text = "\(objConsultation.watch_count)"
    }
}
