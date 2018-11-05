//
//  Subtraction.swift
//  QuizApp
//
//  Created by Aditi Agrawal on 12/17/16.
//  Copyright © 2016 asvinp. All rights reserved.
//

import UIKit

class Subtraction: UIViewController {

    
    @IBOutlet var timerNumber: UILabel!
    @IBOutlet var num1: UILabel!
    @IBOutlet var num2: UILabel!
    @IBOutlet var answer: UITextField!
    
    @IBOutlet var scoreNumber: UILabel!
    @IBOutlet var questionNumber: UILabel!
    @IBOutlet var sign: UILabel!
    @IBOutlet var status: UILabel!
    var userAnswer: String = ""
    var realAnswer: Int = 0
    var questionNum: Int = 0
    var scoreNum: Int = 0
    var timerNum: Int = 5
    
    var timer: Timer = Timer()
    
    
    //Start here
    override func viewDidLoad() {
        super.viewDidLoad()
        answer.becomeFirstResponder()
        
        
        // Do any 	al setup after loading the view.
        answer.inputView = UIView()
        
        randomQuestions()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //get questions and answer
    func randomQuestions(){
        var randNum1 = Int(arc4random_uniform(9))
        randNum1 += 1
        var randNum2 = Int(arc4random_uniform(9))
        randNum2 += 1
        
        self.num1.text = String(randNum1)
        self.num2.text = String(randNum2)
        self.sign.text = String("-")
        
        if (randNum1 < randNum2){
            self.num1.text = String(randNum2)
            self.num2.text = String(randNum1)
        realAnswer = (randNum2 - randNum1)
        
        }
        else{
            self.num1.text = String(randNum1)
            self.num2.text = String(randNum2)
        realAnswer = (randNum1 - randNum2)

        }
        //Set Question Number
        questionNum += 1
        self.questionNumber.text = String(questionNum)
        
        
        
        resetTimer()
        
        
        
    }
    
    //scoreDialog
    func showDialog(){
        let alertController = UIAlertController(title: "Congratulations!", message: "Your score is \(scoreNum)", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler:
            {action in
                self.dismiss(animated: true, completion: {});
                self.navigationController!.popViewController(animated: true);
                
                
        })
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    //Timer
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Subtraction.countdown), userInfo: nil, repeats: true)
    }
    
    func countdown() {
        if(timerNum > 0) {
            timerNum -= 1
            self.timerNumber.text = String(timerNum)
        }
        else if(timerNum == 0 && questionNum < 10){
            self.status.text = "Out of Time!"
            randomQuestions()
        }
        else if(questionNum == 10){
            timer.invalidate()
            showDialog()
        }
        
        
    }
    
    func resetTimer(){
        timer.invalidate()
        timerNum = 5
        startTimer()
    }
    
    
    func checkAnswer(){
        
        userAnswer = answer.text!
        if(userAnswer == String(realAnswer)){
            self.status.text = "Correct!"
            scoreNum += 1
            self.scoreNumber.text = String(scoreNum)
            self.answer.text = ""
            if(questionNum == 10){
                timer.invalidate()
                showDialog()
            }
            else{
                randomQuestions()
                
            }
        }
    }
    
    
    
    //Enter button action

    @IBAction func btnEnter(_ sender: Any) {
        //       userAnswer = answer.text!
        
        //        if (userAnswer == String(realAnswer)){
        //         self.status.text = "Correct!"
        //        scoreNum += 1
        //      self.scoreNumber.text = String(scoreNum)
        //        }
        //        else{
        self.status.text = "Incorrect!"
        //        }
        self.answer.text = ""
        
        
        
        
        if (questionNum == 10){
            showDialog()
        }
        else{
            randomQuestions()
        }
    }
    //Program number button input
    
    @IBAction func btn0Act(_ sender: Any) {
        self.answer.insertText("0");
        checkAnswer()
    }

    @IBAction func btn1Act(_ sender: Any) {
        self.answer.insertText("1");
        checkAnswer()
        
    }

    @IBAction func btn2Act(_ sender: Any) {
        self.answer.insertText("2");
        checkAnswer()
        
    }

    @IBAction func btn3Act(_ sender: Any) {
        self.answer.insertText("3");
        checkAnswer()
        
    }

    @IBAction func btn4Act(_ sender: Any) {
        self.answer.insertText("4");
        checkAnswer()
        
    }

    @IBAction func btn5Act(_ sender: Any) {
        self.answer.insertText("5");
        checkAnswer()
        
    }

    @IBAction func btn6Act(_ sender: Any) {
        self.answer.insertText("6");
        checkAnswer()
        
    }

    @IBAction func btn7Act(_ sender: Any) {
        self.answer.insertText("7");
        checkAnswer()
        
    }


    @IBAction func btn8Act(_ sender: Any) {
        self.answer.insertText("8");
        checkAnswer()
        
    }

    @IBAction func btn9Act(_ sender: Any) {
        self.answer.insertText("9");
        checkAnswer()
        
    }


}
