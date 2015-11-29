//
//  Event.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-27.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import Foundation

class Announcement{
    var title = ""
    var description = ""
    var date = ""

    
    init (title: String, description: String, date: String){
        self.title = title
        self.description = description
        self.date = date
    }
    
    init(){
        
    }
}