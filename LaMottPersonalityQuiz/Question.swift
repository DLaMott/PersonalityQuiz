//
//  Question.swift
//  LaMottPersonalityQuiz
//
//  Created by Dylan LaMott on 10/25/21.
//

import Foundation
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType{
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var houseType: House
}

enum House: Character{
    case slytherin = "🐍", gryffindor = "🦁", hufflepuff = "🦨", ravenclaw = "🦅"
    
    var defintion: String{
        switch self {
        case .gryffindor:
            return "You value courage, bravery, nerve, and chivalry. You will make a fine addition to the house of Gryffindor"
        case .hufflepuff:
            return "You vaule hard work, patience, justice, and loyalty. You will make a wonderful addition to the house of Hufflepuff"
        case .ravenclaw:
        return "You value inteliigence, learning, wisdom, and wit. Ravenclaw will suit you well"
        case .slytherin:
        return "You value ambition, cunning, leadership, and resoursefulness. If possible you will do anything to get your way. You will do great things in the house of Slytherin"
        }
    }
}
