//
//  QuestionsController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-25.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit

class QuestionsController: UIViewController {
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    let questions = ["General", "Programming", "Law", "Math", "Business", "Accounting", "Nursing", "Miscellaneous", "Off-Topic", "Dumb Questions"]
    @IBOutlet weak var questionsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as UITableViewCell!
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
        }
        
        cell!.textLabel!.text = questions[indexPath.row]
        return cell!
    }
    
}
