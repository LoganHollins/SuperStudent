//
//  AddAnswerViewController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//


import UIKit
import Alamofire

class AddAnswerViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerField: UITextView!
    var question = Question()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = "\(question.title)"
        
        self.answerField.layer.borderWidth = 1
        self.answerField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        self.answerField.layer.cornerRadius = 5
    }
    

    @IBAction func handleReply(sender: AnyObject) {
        let dFormatter = NSDateFormatter()
        dFormatter.dateFormat = "yyyy-MM-dd"

        let tFormatter = NSDateFormatter()
        tFormatter.dateFormat = "hh:mm a"
        
        let currentDate = NSDate()
        
        
        let parameters : [String : AnyObject] = [
            "answer": answerField.text!,
            "questionId": question.id,
            "date": dFormatter.stringFromDate(currentDate),
            "time": tFormatter.stringFromDate(currentDate),
            "postedBy": StudentInfo.StudentId,
            "upvotes": "0"
        ]
        
        Alamofire.request(.POST, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Answers?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ", parameters: parameters, encoding: .JSON) 
        navigationController?.popViewControllerAnimated(true)
    
    }

    
}