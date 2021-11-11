//
//  QuestionViewController.swift
//  LaMottPersonalityQuiz
//
//  Created by Dylan LaMott on 10/25/21.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // Outlets
    //Main question
    @IBOutlet var mainQuestionLabel: UILabel!
 
    // Mutiple stack outlets
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabel1: UILabel!
    @IBOutlet var multipleLabel2: UILabel!
    @IBOutlet var multipleLabel3: UILabel!
    @IBOutlet var multipleLabel4:
        UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    
    // Ranged outlets
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    
    //Progress bar outlet
    @IBOutlet var progressViewLabel: UIProgressView!
    
    
   //Outlets for single stack
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    

    
    
    
    
    
    // Object as an array of questions
    var questions: [Question] = [
    Question(
        text: "What best describes you?",
        type: .single,
        answers: [
            Answer(text: "Brave", houseType: .gryffindor),
            Answer(text: "Smart", houseType: .ravenclaw),
            Answer(text: "Kind", houseType: .hufflepuff),
            Answer(text: "Cunning", houseType: .slytherin)
        ]
    ),
        Question(
            text: "What do you fear?",
            type: .single,
            answers: [
                Answer(text: "Nothing!", houseType:
                    .gryffindor),
                Answer(text: "Failing in school", houseType: .ravenclaw),
                Answer(text: "Losing my friends", houseType: .hufflepuff),
                Answer(text: "Losing in general", houseType:
                    .slytherin)
            ]
        ),
    
        Question(text: "Do you study the night before exams?",
                 type: .multiple,
                 answers: [
                    Answer(text: "I'll just cheat",
                        houseType: .slytherin),
                    Answer(text: "I feel confident enough",
                        houseType: .gryffindor),
                    Answer(text: "I studied for weeks so no", houseType: .hufflepuff),
                    Answer(text: "I always study the night before!", houseType: .ravenclaw)
                 ]
        ),
        Question(
            text: "What suits you more?",
            type: .single,
            answers: [
                Answer(text: "Knowledge", houseType: .ravenclaw),
                Answer(text: "Happiness", houseType: .hufflepuff),
                Answer(text: "Leadership", houseType: .gryffindor),
                Answer(text: "Power", houseType: .slytherin)
            ]
        ),
        Question(
            text: "A stranger attacks, you would..",
            type: .multiple,
            answers: [
                Answer(text: "Take the lead, defend", houseType: .gryffindor),
                Answer(text: "Determine a plan first", houseType: .ravenclaw),
                Answer(text: "Get help first", houseType:
                    .hufflepuff),
                Answer(text: "Destroy the attacker", houseType: .slytherin)
            ]
        ),
        Question(
            text: "Favorite class?",
            type: .multiple,
            answers: [
                Answer(text: "Flying", houseType: .gryffindor),
                Answer(text: "History", houseType: .ravenclaw),
                Answer(text: "Herbology", houseType: .hufflepuff),
                Answer(text: "Dark Arts", houseType: .slytherin)
            ]
        ),
        Question(
            text: "What would you rather be?",
            type: .single,
            answers: [
                Answer(text: "President", houseType: .gryffindor),
                Answer(text: "Scientist", houseType: .ravenclaw),
                Answer(text: "Social worker", houseType: .hufflepuff),
                Answer(text: "CEO", houseType: .slytherin)
            ]
        ),
        Question(
            text: "Favorite movie genere?",
            type: .single,
            answers: [
                Answer(text: "Action", houseType: .gryffindor),
                Answer(text: "Documentary", houseType: .ravenclaw),
                Answer(text: "Romance", houseType: .hufflepuff),
                Answer(text: "Horror", houseType: .slytherin)
            ]
        ),
        Question(
            text: "Are you trustworthy?",
            type: .ranged,
            answers: [
                Answer(text: "Not at all", houseType: .slytherin),
                Answer(text: "Sometimes", houseType: .ravenclaw),
                Answer(text: "Generally", houseType: .gryffindor),
                Answer(text: "Always my friends are important", houseType: .hufflepuff)
            ]
        ),
        Question(text: "How much do you feel the need to win?",
                 type: .ranged,
                 answers: [
                    Answer(text: "Im too busy studying to care", houseType: .ravenclaw),
                    Answer(text: "I kind of care", houseType: .hufflepuff),
                    Answer(text: "I will do my best!", houseType: .gryffindor),
                    Answer(text: "I will win at all costs.", houseType: .slytherin)
                 ]
        )
        // End of Array
    ]
    // Question Counter
    var questionIndex = 0
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //Action for single stack buttons
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    // Action for multiple stack button
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn{
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    // Action for ranged stack button
    @IBAction func rangedAnswerButtonPressed() {
        
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    
    
    // To handle Stack view update
    func updateUI(){
        
        // Stack views hidden by default
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = (Float(questionIndex) / Float(questions.count))
        
        
        // Set navigation title by question number
        navigationItem.title = "Question #\(questionIndex + 1)"
        mainQuestionLabel.text = currentQuestion.text
        progressViewLabel.setProgress(totalProgress, animated: true)
        
        // Switch to determine stack view to show
        switch currentQuestion.type{
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updatedRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    
    func updatedRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    func nextQuestion(){
        
        questionIndex += 1
        if questionIndex < questions.count{
            updateUI()
        }else{
            performSegue(withIdentifier: "Results", sender: nil)
        }
        
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
    

}
