//
//  Question.swift
//  HowToBecomeMillioner
//
//  Created by Kirill Titov on 03/12/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation
protocol q {
    var question: String { get }
    var first: String { get }
    var second: String { get }
    var third: String { get }
    var fourth: String { get }
    var answer: String { get }
}

class Questions {
    
    struct first: q {
        let question = "Как правильно продолжить прибев детской песни \"Тили-тили...\" ?"
        
        let first = "хали-гали"
        let second = "трали-вали"
        let third = "жили-были"
        let fourth = "ели-пили"
        
        let answer = "трали-вали"
    }
    
    struct second: q {
        let question = "Что понадобится чтобы взрыхлить грядку ?"
        
        let first = "тяпка"
        let second = "бабка"
        let third = "скобка"
        let fourth = "тряпка"
        
        let answer = "тяпка"
    }
    
    struct third: q {
        let question = "Как называется экзотическое животное из Южной Америки ?"
        
        let first = "пчеложор"
        let second = "термитоглот"
        let third = "муравьед"
        let fourth = "комаролов"
        
        let answer = "муравьед"
    }
    
    struct fourth: q {
        let question = "Во что перевоплозается гусеница ?"
        
        let first = "в мячик"
        let second = "в пирамидку"
        let third = "в машинку"
        let fourth = "в куколку"
        
        let answer = "в куколку"
    }
    
    struct fifth: q {
        let question = "К какой группе музыкальных инструментов относится валторона ?"
        
        let first = "струнные"
        let second = "клавишные"
        let third = "ударные"
        let fourth = "духовые"
        
        let answer = "духовые"
    }
    
    var questions: [q] = [first(), second(), third(), fourth(), fifth()]
}
