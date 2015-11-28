//
//  Question.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-27.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import Foundation

class Question {
    var title = ""
    var question = ""
    var category = ""
    var date = ""
    var time = ""
    var postedBy = ""
    var upvotes = ""
    
    init (title: String, question: String, category : String, date: String, time: String, postedBy: String, upvotes: String){
        self.title = title
        self.question = question
        self.category = category
        self.date = date
        self.time = time
        self.postedBy = postedBy
        self.upvotes = upvotes
    }
    
    init(){
        
    }
    
}