//
//  AnnouncementViewController.swift
//  SuperStudent
//
//  Created by Lukasz Pacyk on 2015-11-28.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController {
    var announcementObject = Announcement()

    override func viewDidLoad() {
        super.viewDidLoad()

        print(announcementObject.title)
        // Do any additional setup after loading the view.
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