//
//  PQAHomeViewController.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/11/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit
import ICSPullToRefresh

class PQAHomeViewController: PQABaseViewController, UITableViewDelegate, UITableViewDataSource, PQAHomeDetailViewControllerDelegate {

    @IBOutlet weak var homeTableView: UITableView!
    
    var list : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Home"
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.homeTableView .registerNib(UINib(nibName: "PQACustomHomeTableViewCell", bundle: nil), forCellReuseIdentifier: kCustomHomeCellIdentifier)
        
        self.homeTableView .addPullToRefreshHandler { () -> () in
            self .getDataFromServer()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self .getDataFromServer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    // MARK: - Method Call Api
    
    func getDataFromServer() {
        NetworkManager .sharedManager .showAnimatedProgressHUD(kLoadingTitle)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            NetworkManager .sharedManager .getListDataFromServer { (responseObect: NSMutableArray) -> Void in
                NetworkManager .sharedManager .hideAnimatedProgressHUD()
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.list = responseObect
                    DLog("\(self.list.count)")
                    //            DataManager .sharedManager .saveDaTaToLocal(self.list)
                    self.homeTableView .reloadData()
                    self.homeTableView.pullToRefreshView?.stopAnimating()
                })
            }
        })
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
        detailCell.delegate = self
        
        self.navigationController! .pushViewController(detailCell, animated: true)
    }
    
    func pressActiveDummyRandom(sender: AnyObject) {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func homdeDelegateFunction(controller: PQAHomeDetailViewController, text: String) {
        DLog("Delegate action \(text) \(controller)")
    }
}
