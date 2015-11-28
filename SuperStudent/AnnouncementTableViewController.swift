//
//  AnnouncementTableViewController.swift
//  SuperStudent
//
//  Created by Shane Armstrong on 2015-11-27.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit

class AnnouncementTableViewController: UITableViewController {
    
    var announcementObject: String!
    let simpleTableIdentifier = "SimpleTableIdentifier"

    @IBOutlet var announcementTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(announcementObject)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as UITableViewCell!
        
        let att = [NSFontAttributeName : UIFont.boldSystemFontOfSize(15)]
        
        let attrDate = NSMutableAttributedString(string:"Date: ", attributes:att)
        let attrDesc = NSMutableAttributedString(string:"Description: ", attributes:att)
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
        }
    
        if(indexPath.row == 0) {
            cell!.textLabel!.text =  announcementObject
        }
        if(indexPath.row == 1) {
            cell!.textLabel!.text = attrDate.string
        }
        if(indexPath.row == 2) {
            cell!.textLabel!.text = attrDesc.string
        }
        return cell!
    }
}
