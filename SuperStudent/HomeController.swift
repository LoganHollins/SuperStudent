//
//  HomeController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-25.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var bcitLogo: UIImageView!
    let bcit = "bcit.jpg"
    var announcements:[String] = []
    let events = ["Shane's Birthday Bonanza", "AMD event", "National Paint Drying Observation Challenge", "Solar Eclipse 2016", "Snape kills Dumbledore"]
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Announcements?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ").responseJSON { response in
            
            if let json = response.result.value {
                var data = JSON(json)
                for i in 0...data.count - 1 {
                    self.announcements.append(String(data[i]["title"]))
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
                

            }
        }

        bcitLogo.image = UIImage(named: bcit)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == self.tableView) {
            return announcements.count
        } else {
            return events.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as UITableViewCell!
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
        }
        if(tableView == self.tableView) {
            cell!.textLabel!.text = announcements[indexPath.row]
        } else {
            cell!.textLabel!.text = events[indexPath.row]
        }
        return cell!
    }
}