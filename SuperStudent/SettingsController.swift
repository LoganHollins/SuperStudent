//
//  SettingsController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-25.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class SettingsController: UIViewController {
    
    @IBOutlet weak var aboutText: UITextView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mirelaView: UIImageView!
    @IBOutlet weak var darcyView: UIImageView!
    @IBOutlet weak var profilePic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "https://api.mongolab.com/api/1/databases/rhythmictracks/collections/Users", parameters: ["apiKey": "L4HrujTTG-XOamCKvRJp5RwYMpoJ6xCZ", "q": "{'studentId': '\(StudentInfo.StudentId)'}"]).responseJSON { response in
            
            if let json = response.result.value {
                var data = JSON(json)
                print(data)
                let fname = data[0]["firstName"].stringValue
                let lname = data[0]["lastName"].stringValue
                self.nameLabel.text = "\(fname) \(lname)"
                self.idLabel.text = data[0]["studentId"].stringValue
                self.emailLabel.text = data[0]["email"].stringValue
                self.aboutText.text = data[0]["about"].stringValue
                self.profilePic.image = UIImage(named: data[0]["pic"].stringValue)
                
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
