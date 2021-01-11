//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var progressBarStatus: UIProgressView!
    @IBOutlet weak var score: UILabel!
    
    var dataQuiz = DataQuiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerBtn(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = dataQuiz.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        dataQuiz.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    @objc func updateUI() {
        questionLabel.text = dataQuiz.getQuestionText()
        
        let answerChoice = dataQuiz.getAnswers()
        btnA.setTitle(answerChoice[0], for: .normal)
        btnB.setTitle(answerChoice[1], for: .normal)
        btnC.setTitle(answerChoice[2], for: .normal)
        
        
        progressBarStatus.progress = dataQuiz.getProgress()
        score.text = "Score : \(dataQuiz.getScore())"
        btnA.backgroundColor = UIColor.clear
        btnB.backgroundColor = UIColor.clear
        btnC.backgroundColor = UIColor.clear
    }
    


}

