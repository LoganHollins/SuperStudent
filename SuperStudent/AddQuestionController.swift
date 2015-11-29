//
//  AddQuestionController.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire

class AddQuestionController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var header = String()
    let questions = ["General", "Computing", "Business", "Engineering", "Math", "Law", "Accounting", "Nursing", "Apprenticeships", "Off-Topic"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var questionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionText.layer.borderWidth = 1
        self.questionText.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        self.questionText.layer.cornerRadius = 5
        pickerView.selectRow(questions.indexOf(header)!, inComponent: 0, animated: true)
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        addQuestion()
        navigationController?.popViewControllerAnimated(true)
    }
    
    func addQuestion() {
        let dFormatter = NSDateFormatter()
        dFormatter.dateFormat = "yyyy-MM-dd"
        
        let tFormatter = NSDateFormatter()
        tFormatter.dateFormat = "hh:mm a"
        
        let currentDate = NSDate()
        let category = questions[pickerView.selectedRowInComponent(0)]
        
        let parameters : [String : AnyObject] = [
            "title": titleText.text!,
            "question": questionText.text,
            "category": category,
            "date": dFormatter.stringFromDate(currentDate),
            "time": tFormatter.stringFromDate(currentDate),
            "postedBy": StudentInfo.StudentId,
            "upvotes": "0"
        ]
        
        Alamofire.request(.POST, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Questions?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ", parameters: parameters, encoding: .JSON)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questions.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return questions[row]
    }
}