//
//  PQAHomeViewController.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/11/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit

class PQAHomeViewController: PQABaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var homeTableView: UITableView!
    
    var list : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Home"
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.homeTableView .registerNib(UINib(nibName: "PQACustomHomeTableViewCell", bundle: nil), forCellReuseIdentifier: kCustomHomeCellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkManager .sharedManager .showAnimatedProgressHUD(kLoadingTitle)
        NetworkManager .sharedManager .getListDataFromServer { (responseObect: NSMutableArray) -> Void in
            NetworkManager .sharedManager .hideAnimatedProgressHUD()
            self.list = responseObect
            DataManager .sharedManager .saveDaTaToLocal(self.list)
            self.homeTableView .reloadData()
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.list.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCellWithIdentifier(kCustomHomeCellIdentifier, forIndexPath: indexPath) as! PQACustomHomeTableViewCell
        
        let objDict = self.list .objectAtIndex(indexPath.section) as! Consultation
        
        cell.btnActionDummy .addTarget(self, action: "pressActiveDummyRandom:", forControlEvents: UIControlEvents.TouchUpInside)
        cell .fillDataToCell(objDict)
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        cell.backgroundColor =  RGBColor(239, g: 239, b: 244)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        DataManager .sharedManager .getAllConsultationRecordFromLocal("EntityConsultation")

        let detailCell = PQAHomeDetailViewController .init(nibName: "PQAHomeDetailViewController", bundle: NSBundle.mainBundle())
        let objConsultation = self.list .objectAtIndex(indexPath.section) as! Consultation
        
        detailCell.objConsultation = objConsultation
        
        self.navigationController! .pushViewController(detailCell, animated: true)
    }
    
    func pressActiveDummyRandom(sender: AnyObject) {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
