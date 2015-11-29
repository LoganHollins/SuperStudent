//
//  AnnouncementViewController.swift
//  SuperStudent
//
//  Created by Lukasz Pacyk on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var announcementObject = Announcement()
    let identifiers:[String] = ["Title", "Date", "Description"]
    let simpleTableIdentifier = "detailsTableCell"
    var announcements:[String] = []
    
    @IBOutlet weak var announcementTable: UITableView!
    
    
    override func viewDidLoad() {
        
        announcements = [announcementObject.title, announcementObject.date, announcementObject.description]
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as UITableViewCell!
    
    if(cell == nil) {
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: simpleTableIdentifier)
    }
    if(indexPath.row == 2){
        cell!.detailTextLabel!.numberOfLines = 10
        cell!.detailTextLabel!.lineBreakMode = NSLineBreakMode.ByWordWrapping
    }
        
    cell!.textLabel!.text = identifiers[indexPath.row]
    cell!.detailTextLabel!.text = announcements[indexPath.row]
    cell!.detailTextLabel!.sizeToFit()
    return cell!
    }

    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            if indexPath.row == 2 {
                return 200
            } else {
                return 50 
            }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
