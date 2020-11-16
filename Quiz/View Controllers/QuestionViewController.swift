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
    
    @IBOutlet weak var segmentedStackView: UIStackView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var progressBar: UIProgressView!

    private var currentQuestionAnswers: [Answer] {
        currentQuestion.answers
    }
    private var currentQuestion: Question {
        Question.all[questionIndex]
    }
    var questionIndex = 0
    var userAnswers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        for responseView in [singleStackView, multipleStackView, rangeStackView, segmentedStackView] {
            responseView?.isHidden = true
        }
        
        navigationItem.title = "Вопрос №\(questionIndex + 1)"
        
        let totalProgress = Float(questionIndex) / Float(Question.all.count)
        
        questionTextLabel.text = currentQuestion.text
        progressBar.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack()
        case .multiple:
            updateMultipleStack()
        case .range:
            updateRangeStack()
        case .segmented:
            updateSegmented()
        }
    }
    
    func updateSingleStack() {
        for (index, button) in singleButtons.enumerated() {
            button.setTitle(nil, for: [])
            button.tag = index
        }
        for (button, answer) in zip(singleButtons, currentQuestionAnswers) {
            button.setTitle(answer.text, for: [])
        }
        singleStackView.isHidden = false
    }
    
    func updateMultipleStack() {
        for label in multipleLabels {
            label.text = ""
        }
        for (label, answer) in zip(multipleLabels, currentQuestionAnswers) {
            label.text = answer.text
        }
        multipleStackView.isHidden = false
    }
    
    func updateRangeStack() {
        rangeLeftLabel.text = currentQuestionAnswers.first?.text
        rangeRightLabel.text = currentQuestionAnswers.last?.text

        rangeSlider.maximumValue = Float(currentQuestionAnswers.count - 1)
        rangeSlider.value = rangeSlider.maximumValue / 2

        rangeStackView.isHidden = false
    }
    
    func updateSegmented() {
        segmentedControl.removeAllSegments()
        for (index, answer) in currentQuestionAnswers.enumerated() {
            segmentedControl.insertSegment(withTitle: answer.text, at: index, animated: false)
        }
        segmentedControl.selectedSegmentIndex = 0
        segmentedStackView.isHidden = false
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex >= Question.all.count {
            performSegue(withIdentifier: "ShowResults", sender: nil)
        } else {
            updateUI()
        }
    }

    
    @IBAction func singleAnswerClicked(_ sender: UIButton) {
        let index = sender.tag
        guard index >= 0 && index < currentQuestionAnswers.count else {
            return
        }
        userAnswers.append(currentQuestionAnswers[index])
        nextQuestion()
    }
    
    @IBAction func multipleAnswerClicked(_ sender: UIButton) {
        for index in 0..<currentQuestionAnswers.count {
            if multipleSwitches[index].isOn {
                userAnswers.append(currentQuestionAnswers[index])
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangeAnswerClicked(_ sender: UIButton) {
        let index = Int(round(rangeSlider.value))
        userAnswers.append(currentQuestionAnswers[index])
        nextQuestion()
    }
    
    @IBAction func segmentedAnswerClicked(_ sender: UIButton) {
        let index = segmentedControl.selectedSegmentIndex
        userAnswers.append(currentQuestionAnswers[index])
        nextQuestion()
    }
    
    @IBSegueAction func resultsSegue(_ coder: NSCoder) -> ResultViewController? {
        return ResultViewController.init(coder: coder, userAnswers)
    }
}
