//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Сергей on 11.11.2020.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var questionTextLabel: UILabel!
    
    @IBOutlet weak var singleFirstAnswerButton: UIButton!
    @IBOutlet weak var singleSecondAnswerButton: UIButton!
    @IBOutlet weak var singleThirdAnswerButton: UIButton!
    @IBOutlet weak var singleFourthAnswerButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!

    var questionIndex = 0
    var progress: Float {
        return Float(questionIndex) / Float(Question.all.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        
        navigationItem.title = "Вопрос №\(questionIndex + 1)"
        progressBar.progress = progress
        
        let question = Question.all[questionIndex]
        
        questionTextLabel.text = question.text
        
        switch question.type {
        case .single:
            singleFirstAnswerButton.setTitle(question.answers[0].text, for: [])
            singleSecondAnswerButton.setTitle(question.answers[1].text, for: [])
            singleThirdAnswerButton.setTitle(question.answers[2].text, for: [])
            singleFirstAnswerButton.setTitle(question.answers[3].text, for: [])
            singleStackView.isHidden = false
        case .multiple:
            multipleStackView.isHidden = false
        case .range:
            rangeStackView.isHidden = false
        }
        
        questionIndex = (questionIndex + 1) % Question.all.count
    }
    
    @IBAction func singleAnswerClicked(_ sender: UIButton) {
        updateUI()
    }
    

}
