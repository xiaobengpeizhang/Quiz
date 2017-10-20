//
//  Copyright © 2015 Big Nerd Ranch
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabelCenterConstraint: NSLayoutConstraint!
    var screenWidth: CGFloat {
        return view.bounds.width
    }
    
    let questions: [String] = [
        "From what is cognac made?",
        "What is 7+7?",
        "What is the capital of Vermont?"
    ]
    let answers: [String] = [
        "Grapes",
        "14",
        "Montpelier"
    ]
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0.0
        updateScreenLabel()
    }
    
    func updateScreenLabel() {
        nextQuestionLabelCenterConstraint.constant = -screenWidth
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        questionLabelAnimationTransition()
        answerLabel.text = "???"
    }
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func questionLabelAnimationTransition() {
        view.layoutIfNeeded()
        currentQuestionLabelCenterConstraint.constant += screenWidth
        nextQuestionLabelCenterConstraint.constant = 0
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            self.currentQuestionLabel.alpha = 0.0
            self.nextQuestionLabel.alpha = 1.0
            self.view.layoutIfNeeded()
        }) { _ in
            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
            swap(&self.currentQuestionLabelCenterConstraint, &self.nextQuestionLabelCenterConstraint)
            self.updateScreenLabel()
        }
    }
    
    func address<T: AnyObject>(o: T) -> String {
        return String.init(format: "%018p", unsafeBitCast(o, to: Int.self))
    }

}

