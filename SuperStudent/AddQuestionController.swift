//
//  AddQuestionController.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit

class AddQuestionController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var questionText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionText.layer.borderWidth = 1
        self.questionText.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        self.questionText.layer.cornerRadius = 5
    }
    
}