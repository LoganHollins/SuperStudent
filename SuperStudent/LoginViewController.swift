//
//  LoginViewController.swift
//  SuperStudent
//
//  Created by Shane Armstrong on 2015-11-27.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var studentIdField: UITextField!
    
    @IBOutlet weak var loginImage: UIImageView!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordField.delegate = self
        self.studentIdField.delegate = self
        loginImage.image = UIImage(named: "bcit-login")
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        //textField code
        
        textField.resignFirstResponder()  //if desired
        loginUser()
        return true
    }

    
    @IBAction func handleLogin(sender: AnyObject) {
        loginUser();
//        self.performSegueWithIdentifier("login", sender: self)
            }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loginUser(){
        self.performSegueWithIdentifier("login", sender: self)
        let id:String = studentIdField.text!
        let pass:String = passwordField.text!
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Users", parameters : ["apiKey":"L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ", "q" : "{'password':'\(pass)', 'studentId':'\(id)'}"]).responseJSON { response in
            
            if let json = response.result.value {
                var data = JSON(json)
                if(data[0] == nil) {
                    self.errorField.text = "Invalid credentials, please try again."
                } else {
                    StudentInfo.StudentId = id
                    self.performSegueWithIdentifier("login", sender: self)
                    
                }
                
            }
        }

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
