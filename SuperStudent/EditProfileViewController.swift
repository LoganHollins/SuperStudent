//
//  EditProfileViewController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire
class EditProfileViewController: UIViewController {

    
    @IBOutlet weak var aboutField: UITextView!
    
    @IBAction func updateProfile(sender: AnyObject) {
        var path = "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Users?apiKey=L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ&q={'studentId':'\(StudentInfo.StudentId)'}"
        path = path.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        Alamofire.request(.PUT, path, parameters: ["$set": ["about":aboutField.text]], encoding: .JSON)
        StudentInfo.About = aboutField.text
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutField.text = StudentInfo.About
        // Do any additional setup after loading the view.
        self.aboutField.layer.borderWidth = 1
        self.aboutField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        self.aboutField.layer.cornerRadius = 5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
