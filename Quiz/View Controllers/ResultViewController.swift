//
//  ResultViewController.swift
//  Quiz
//
//  Created by Сергей on 11.11.2020.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroTypeLabel: UILabel!
    @IBOutlet weak var heroDefinitionLabel: UILabel!
    
    let answers: [Answer]
    
    init?(coder: NSCoder, _ answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateFrequencyOfAnswers()
    }
    
    func calculateFrequencyOfAnswers() {
        let frequencyOfAnswers: [HeroType: Int] = answers.reduce(into: [:], { (percentage, answer) in
            for (heroType, percent) in answer.percentage {
                percentage[heroType, default: 0] += percent
            }
        })
        let frequencyOfAnswersSorted = frequencyOfAnswers.sorted { $0.value > $1.value }
        let mostCommonAnswer = frequencyOfAnswersSorted.first!.key
        updateUI(with: mostCommonAnswer)
    }
    
    func updateUI(with answer: HeroType) {
        heroImage.image = UIImage(named: answer.image)
        heroTypeLabel.text = "Вы - это \(answer.rawValue)"
        heroDefinitionLabel.text = answer.definition
    }
}
