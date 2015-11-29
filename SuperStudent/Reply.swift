//
//  Reply.swift
//  SuperStudent
//
//  Created by Tom Bui on 2015-11-27.
//  Copyright © 2015 Logan Hollins. All rights reserved.
//

import Foundation

class Reply {
    var answer = ""
    var questionId = ""
    var date = ""
    var time = ""
    var postedBy = ""
    var upvotes = ""
    
    init (answer: String, questionId: String, date: String, time: String, postedBy: String, upvotes: String) {
        self.answer = answer
        self.questionId = questionId
        self.date = date
        self.time = time
        self.postedBy = postedBy
        self.upvotes = upvotes
    }
    
    init() {
        
    }
    
}