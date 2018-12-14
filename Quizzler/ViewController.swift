//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    let pointsAwarded : Int = 10
    var pickedAnswer : Bool = false
    var correctAnswer : Bool = false
    var currentQuestion : Int = 0
    var currentPoints : Int = 0
    var currentProgress : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
            ProgressHUD.showSuccess("Correct")
        }
        else if sender.tag == 2 {
            pickedAnswer = false
            ProgressHUD.showError("Wrong")
        }
        
        checkAnswer()
  
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(currentPoints)"
        progressLabel.text = "\(currentQuestion+1)/\(allQuestions.list.count)"
        questionLabel.text = allQuestions.list[currentQuestion].questionTest
        progressBar.frame.size.width = (view.frame.width / CGFloat(allQuestions.list.count)) * CGFloat(currentQuestion+1)
    }
    

    func nextQuestion() {
        
        if currentQuestion == allQuestions.list.count-1 {
            //adding in the alert popup menu.
            let alert = UIAlertController(title: "Quiz Over", message: "Would you like to restart?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }else {
            currentQuestion += 1
        }
        
    }
    
    
    func checkAnswer() {
        if pickedAnswer == allQuestions.list[currentQuestion].answer {
            correctAnswer = true
            currentPoints += pointsAwarded
        }else {
            correctAnswer = false
        }
        nextQuestion()
        updateUI()
    }
    
    
    func startOver() {
        currentQuestion = 0
        currentPoints = 0
        updateUI()
    }
    

    
}
