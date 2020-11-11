//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Сергей on 11.11.2020.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionTextLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
        
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var rangeLeftLabel: UILabel!
    @IBOutlet weak var rangeRightLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!

    var questionIndex = 0
    var userAnswers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        
        navigationItem.title = "Вопрос №\(questionIndex + 1)"
        
        let question = Question.all[questionIndex]
        let totalProgress = Float(questionIndex) / Float(Question.all.count)
        
        questionTextLabel.text = question.text
        progressBar.setProgress(totalProgress, animated: true)
        
        switch question.type {
        case .single:
            updateSingleStack()
        case .multiple:
            updateMultipleStack()
        case .range:
            updateRangeStack()
        }
    }
    
    func updateSingleStack() {
        let answers = getCurrentQuestionAnswers()
        for (index, button) in singleButtons.enumerated() {
            button.setTitle(nil, for: [])
            button.tag = index
        }
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: [])
        }
        singleStackView.isHidden = false
    }
    
    func updateMultipleStack() {
        let answers = getCurrentQuestionAnswers()
        for (index, label) in multipleLabels.enumerated() {
            label.text = ""
            // TODO: set tags for switches
        }
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
        multipleStackView.isHidden = false
    }
    
    func updateRangeStack() {
        let answers = getCurrentQuestionAnswers()
        rangeLeftLabel.text = answers.first?.text
        rangeRightLabel.text = answers.last?.text
        rangeStackView.isHidden = false
    }
    
    func nextQuestion() {
        print(userAnswers)
        questionIndex = (questionIndex + 1) % Question.all.count
        updateUI()
    }
    
    func getCurrentQuestionAnswers() -> [Answer] {
        return Question.all[questionIndex].answers
    }
    
    @IBAction func singleAnswerClicked(_ sender: UIButton) {
        let answers = getCurrentQuestionAnswers()
        let index = sender.tag
        guard index >= 0 && index < answers.count else {
            return
        }
        userAnswers.append(answers[index])
        nextQuestion()
    }
    
    @IBAction func multipleAnswerClicked(_ sender: Any) {
        nextQuestion()
    }
    
    @IBAction func rangeAnswerClicked(_ sender: Any) {
        nextQuestion()
    }
}
