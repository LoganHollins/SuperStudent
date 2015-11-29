//
//  HomeController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-25.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//
/*
    MAJOR FEATURES
        - Admin role
        - Create Announcements
        - Create Events
        - View Event details
        - Reply to questions
        - Search/filter on data
        - View other profiles
        - Missing CRUD features on announcements, events, questions
    MINOR FEATURES
        - Upvote/downvote questions, replies
    COSMETIC ENHANCEMENTS
        - Fix constraints
*/


import UIKit
import Alamofire
import SwiftyJSON

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var announcementTable: UITableView!
    
    @IBOutlet weak var eventTable: UITableView!
    
    @IBOutlet weak var bcitLogo: UIImageView!
    let bcit = "bcit.jpg"
    var announcements:[Announcement] = []
    var events:[Event] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getEventsAndAnnouncements()
        
        bcitLogo.image = UIImage(named: bcit)
    }
    override func viewDidAppear(animated: Bool) {
        if(StudentInfo.EventCreated){
            StudentInfo.EventCreated = false;
            getEventsAndAnnouncements()
        }
    }
    
    func getEventsAndAnnouncements() {
        events.removeAll()
        announcements.removeAll()
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Announcements?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ", parameters: ["l": 4, "s":"{'_id':-1}"]).responseJSON { response in
            
            if let json = response.result.value {
                var data = JSON(json)
                for i in 0...data.count - 1 {
                    var announcement = Announcement(title: data[i]["title"].stringValue,
                        description: data[i]["description"].stringValue,
                        date: data[i]["date"].stringValue)
                    self.announcements.append(announcement)
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.announcementTable.reloadData()
                })
                
            }
        }
        
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Events?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ", parameters: ["l": 5, "s":"{'_id':-1}"]).responseJSON { response in
            
            if let json = response.result.value {
                var data = JSON(json)
                for i in 0...data.count - 1 {
                    var event = Event(title: data[i]["title"].stringValue,
                        description: data[i]["description"].stringValue,
                        date: data[i]["date"].stringValue,
                        location: data[i]["location"].stringValue,
                        startTime: data[i]["startTime"].stringValue,
                        endTime: data[i]["endTime"].stringValue)
                    self.events.append(event)
                    
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.eventTable.reloadData()
                })
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.announcementTable) {
            return announcements.count
        } else {
            return events.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell!()
        
        if(tableView == self.announcementTable) {
            cell = tableView.dequeueReusableCellWithIdentifier("announcementCell") as UITableViewCell!
            
            if(cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "announcementCell")
            }
            cell!.textLabel!.text = announcements[indexPath.row].title
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("eventCell") as UITableViewCell!
            
            if(cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "eventCell")
            }
            cell!.textLabel!.text = events[indexPath.row].title
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "announcementSegue") {
            if let destination = segue.destinationViewController as? AnnouncementViewController {
                destination.announcementObject = announcements[(announcementTable.indexPathForSelectedRow?.row)!]
            }
        }
        
        if(segue.identifier == "eventSegue") {
            if let destination = segue.destinationViewController as? EventViewController {
                destination.eventObject = events[(eventTable.indexPathForSelectedRow?.row)!]
            }
        }
    }
}