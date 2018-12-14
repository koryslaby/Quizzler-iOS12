//
//  Question.swift
//  Quizzler
//
//  Created by Kory slaby on 12/13/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionTest : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool) {
        
        questionTest = text
        answer = correctAnswer
    }
}
