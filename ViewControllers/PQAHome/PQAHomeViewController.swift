//
//  PQAHomeViewController.swift
//  PricanQAbyGMO
//
//  Created by DEV-MinhNN on 1/11/16.
//  Copyright © 2016 DEV-MinhNN. All rights reserved.
//

import UIKit

class PQAHomeViewController: PQABaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var list : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView .registerNib(UINib(nibName: "PQACustomHomeTableViewCell", bundle: nil), forCellReuseIdentifier: kCustomHomeCellIdentifier)
        
        self.navigationItem.title = "Home View"
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
            self.tableView .reloadData()
        }
    }
    
    /*
    // MARK: - UITableView DataSource
    */
    
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
        
        let objDict = self.list .objectAtIndex(indexPath.section) as! NSDictionary
        
        let objConsultation = Consultation(dict: objDict)
        
        cell .fillDataToCell(objConsultation)
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);

        cell.backgroundColor =  RGBColor(239, g: 239, b: 244)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let detailCell = PQAHomeDetailViewController .init(nibName: "PQAHomeDetailViewController", bundle: nil)
        self.navigationController! .pushViewController(detailCell, animated: true)
    }
}
