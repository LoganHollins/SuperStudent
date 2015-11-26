//
//  SettingsController.swift
//  SuperStudent
//
//  Created by Logan Hollins on 2015-11-25.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    //    let jimbo = "jimbo.jpeg"
    //    let mirela = "mirela.jpeg"
    //    let darcy = "darcy.png"
    
    @IBOutlet weak var mirelaView: UIImageView!
    @IBOutlet weak var darcyView: UIImageView!
    @IBOutlet weak var profilePic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.image = UIImage(named: "jimbo")
        //        mirelaView.image = UIImage(named: "mirela")
        //        darcyView.image = UIImage(named: "darcy")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
