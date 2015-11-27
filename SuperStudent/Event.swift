//
//  Event.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-27.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import Foundation

class Event {
    var title = ""
    var description = ""
    var date = ""
    var location = ""
    var startTime = ""
    var endTime = ""
    
    init (title: String, description: String, date: String, location: String, startTime: String, endTime: String){
        self.title = title
        self.description = description
        self.date = date
        self.location = location
        self.startTime = startTime
        self.endTime = endTime
    }
    
    init(){
        
    }
    
}