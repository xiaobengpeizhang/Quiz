//
//  ViewController.swift
//  Quiz
//
//  Created by 杨佩璋 on 2017/8/11.
//  Copyright © 2017年 云和山的彼端. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    var questions: [String] = ["小奔可不可爱？",
                               "小奔喜欢的零食是？",
                               "小奔喜欢吃的菜是？"]
    var answers: [String] = ["宇宙第一可爱",
                             "香草八喜冰淇淋",
                             "蒸蛋"]
    var currentQuestionIndex: Int = -1
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        question.text = questions[currentQuestionIndex]
        answer.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answer.text = answers[currentQuestionIndex]
    }
    
    
}

