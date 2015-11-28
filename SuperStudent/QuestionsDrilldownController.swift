//
//  QuestionsDrilldownController.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-27.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class QuestionsDrilldownController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var header = String()
    var questions:[Question] = []
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var navigationLabel: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationLabel.title = header
        getQuestions()
    }
    
    func getQuestions() {
        questions.removeAll()
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Questions?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ").responseJSON { response in
            
            if let json = response.result.value {
                var data = JSON(json)
                for i in 0...data.count - 1 {
                    var question = Question(title: data[i]["title"].stringValue,
                        question: data[i]["question"].stringValue,
                        category: data[i]["category"].stringValue,
                        date: data[i]["date"].stringValue,
                        time: data[i]["time"].stringValue,
                        postedBy: data[i]["postedBy"].stringValue,
                        upvotes: data[i]["upvotes"].stringValue)
                    if(question.category == self.header) {
                        self.questions.append(question)
                    }
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.questions.sortInPlace({$0.date < $1.date})
                    self.tableView.reloadData()
                })
                
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as UITableViewCell!
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: simpleTableIdentifier)
        }
        
        cell!.textLabel!.text = questions[indexPath.row].title
        cell!.detailTextLabel!.text = "Posted By: " + questions[indexPath.row].postedBy
        return cell!
    }
}
