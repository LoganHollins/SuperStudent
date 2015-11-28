//
//  ViewQuestionController.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
class ViewQuestionController: UIViewController {
    var question = Question()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UILabel!
    
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
    }
}