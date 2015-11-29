//
//  AddAnnouncementController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire

class AddAnnouncementController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var descriptionField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAnnouncement(sender: AnyObject) {
        let dFormatter = NSDateFormatter()
        dFormatter.dateFormat = "yyyy-MM-dd"
        
        let parameters : [String : AnyObject] = [
            "title": titleField.text!,
            "date": dFormatter.stringFromDate(dateField.date),
            "description": descriptionField.text!
        ]
        
        Alamofire.request(.POST, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Announcements?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ", parameters: parameters, encoding: .JSON)
        StudentInfo.EventCreated = true
        navigationController?.popViewControllerAnimated(true)
    }

}