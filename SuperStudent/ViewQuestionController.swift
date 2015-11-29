//
//  ViewQuestionController.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewQuestionController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var question = Question()
    var replies:[Reply] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UITextView!
    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    let simpleTableIdentifier = "replyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = question.title
        postedByLabel.text = "Posted by: " + question.postedBy
        dateLabel.text = question.date + " " + question.time
        questionLabel.text = question.question
        if Int(question.upvotes) > 0 {
            upvotesLabel.textColor = UIColor.greenColor()
            upvotesLabel.text = "+" + question.upvotes
        } else if Int(question.upvotes) < 0 {
            upvotesLabel.textColor = UIColor.redColor()
            upvotesLabel.text = question.upvotes
        } else {
            upvotesLabel.text = question.upvotes
        }
        getReplies()
    }
    
    func getReplies() {
        replies.removeAll()
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Answers?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ").responseJSON { response in
            
            if let json = response.result.value {
                var data = JSON(json)
                for i in 0...data.count - 1 {
                    var reply = Reply(
                        answer: data[i]["answer"].stringValue,
                        questionId: data[i]["questionId"].stringValue,
                        date: data[i]["date"].stringValue,
                        time: data[i]["time"].stringValue,
                        postedBy: data[i]["postedBy"].stringValue,
                        upvotes: data[i]["upvotes"].stringValue)
                    if(reply.questionId == self.question.id) {
                        self.replies.append(reply)
                    }
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.replies.sortInPlace({$0.date < $1.date})
                    self.tableView.reloadData()
                })
                
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as! ReplyViewCellController!
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier) as! ReplyViewCellController
        }
        
        cell!.replyByLabel.text = replies[indexPath.row].postedBy + " replied:"
        cell!.replyTextView.text = replies[indexPath.row].answer
        cell!.dateLabel.text = replies[indexPath.row].date + " " + replies[indexPath.row].time
        
        if (Int(replies[indexPath.row].upvotes) > 0) {
            cell!.upvotesLabel.textColor = UIColor.greenColor()
            cell!.upvotesLabel.text = "+" + replies[indexPath.row].upvotes
        } else if (Int(replies[indexPath.row].upvotes) < 0) {
            cell!.upvotesLabel.textColor = UIColor.redColor()
            cell!.upvotesLabel.text = replies[indexPath.row].upvotes
        } else {
            cell!.upvotesLabel.text = replies[indexPath.row].upvotes
        }
        
        return cell!
    }
}