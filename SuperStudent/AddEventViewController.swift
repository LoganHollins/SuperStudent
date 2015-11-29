//
//  AddEventViewController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire

class AddEventViewController: UIViewController {
    
    var eventObject = Event()
    
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var endTimeField: UIDatePicker!
    @IBOutlet weak var startTimeField: UIDatePicker!
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var locationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.descriptionField.layer.borderWidth = 1
        self.descriptionField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        self.descriptionField.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createEvent(sender: AnyObject) {
        let dFormatter = NSDateFormatter()
        dFormatter.dateFormat = "yyyy-MM-dd"
        
        let tFormatter = NSDateFormatter()
        tFormatter.dateFormat = "hh:mm a"
        
        let currentDate = NSDate()
        
        
        let parameters : [String : AnyObject] = [
            "title": titleField.text!,
            "date": dFormatter.stringFromDate(dateField.date),
            "location": locationField.text!,
            "startTime": tFormatter.stringFromDate(startTimeField.date),
            "endTime": tFormatter.stringFromDate(startTimeField.date),
            "description": descriptionField.text!
        ]
        Alamofire.request(.POST, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Events?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ", parameters: parameters, encoding: .JSON)
        StudentInfo.EventCreated = true
        navigationController?.popViewControllerAnimated(true)
        
        
        
        
    }
}
