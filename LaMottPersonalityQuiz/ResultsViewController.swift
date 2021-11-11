//
//  ResultsViewController.swift
//  LaMottPersonalityQuiz
//
//  Created by Dylan LaMott on 10/25/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Outlets for results
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefintionLabel: UILabel!
    
    
    
    var responses: [Answer]

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateHouseResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculateHouseResult(){
        let frequencyOfAnswers = responses.reduce(into: [:]){
            (counts, answer) in counts[answer.houseType, default: 0] += 1
        }
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by:{
            (pair1, pair2) in return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswerSorted.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)"
        resultDefintionLabel.text = mostCommonAnswer.defintion
        
        
    }
    
}
