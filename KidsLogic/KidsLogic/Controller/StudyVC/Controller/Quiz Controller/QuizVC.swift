//
//  ViewController.swift
//  quizTestProgramtic
//
//  Created by sara saud on 05/05/1443 AH.
//

import WebKit
import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth
class QuizviewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    static let shared = QuizviewController()
    
    
    // MARK: - properties
    var scoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.backgroundColor = UIColor( #colorLiteral(red: 0, green: 1, blue: 0, alpha: 0.2298841412))
        lbl.font.withSize(50)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = " "
        return lbl
    }()
    var questionCounter: UILabel = {
        let lbl = UILabel()
        lbl.textColor =  .black
        lbl.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0, blue: 0.07303228229, alpha: 0.577088648) )
        lbl.font.withSize(50)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = NSLocalizedString("0/6", comment: "")
        return lbl
        
    }()
    var Swipelabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor =  .gray
        //        lbl.backgroundColor = UIColor(#colorLiteral(red: 0.715143621, green: 0.4925160408, blue: 0.5837199092, alpha: 1))
        lbl.font.withSize(50)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = NSLocalizedString("Swipe Back", comment: "")
        return lbl
        
    }()
    lazy var QImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "css")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
    var questionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.shadowColor = .lightGray
        lbl.backgroundColor = UIColor.quaternarySystemFill
        lbl.font.withSize(80)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = " Qqq ? "
        return lbl
    }()
    lazy var optionA: UIButton = {
        let btn = UIButton()
        
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("A", comment: ""), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(#colorLiteral(red: 0.3279541135, green: 0.6508837342, blue: 0.8242474198, alpha: 0.8470588235) )
        btn.tag = 1
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(answerPressed), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return btn
    }()
    lazy var optionB: UIButton = {
        let btn = UIButton()
        
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("B ", comment: ""), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor( #colorLiteral(red: 0.4231500328, green: 0.6711993814, blue: 0.3329515457, alpha: 0.8470588235) )
        btn.tag = 2
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(answerPressed), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return btn
    }()
    lazy var optionC: UIButton = {
        let btn = UIButton()
        
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("C ", comment: ""), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor( #colorLiteral(red: 0.689653337, green: 0.6372394562, blue: 0.293028295, alpha: 1) )
        btn.tag = 3
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(answerPressed), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return btn
    }()
    lazy var optionD: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString(" D", comment: ""), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(#colorLiteral(red: 0.5469058156, green: 0.43541646, blue: 0.6977834105, alpha: 1) )
        btn.tag = 4
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(answerPressed), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        view.backgroundColor = .white
        
        view.backgroundColor = UIColor (named: "DarkColor")
        
        updateQuestion()
        updateUI()
        
        
        view.addSubview(scoreLabel)
        view.addSubview(questionCounter)
        view.addSubview(Swipelabel)
        
        view.addSubview(QImageView)
        
        view.addSubview(questionLabel)
        
        view.addSubview(optionA)
        view.addSubview(optionB)
        view.addSubview(optionC)
        view.addSubview(optionD)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 40),
            scoreLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 100),
            //            scoreLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 10),
            scoreLabel.heightAnchor.constraint(equalToConstant: 30 ),
            
            questionCounter.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            //            questionCounter.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 200),
            questionCounter.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -100),
            questionCounter.heightAnchor.constraint(equalToConstant: 30),
            
            
            Swipelabel.topAnchor.constraint(equalTo: questionCounter.bottomAnchor, constant: 5),
            Swipelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Swipelabel.heightAnchor.constraint(equalToConstant: 20),
            
            QImageView.topAnchor.constraint(equalTo: Swipelabel.bottomAnchor ),
            QImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            QImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            QImageView.widthAnchor.constraint(equalToConstant: 300),
            QImageView.heightAnchor.constraint(equalToConstant:300),
            
            
            
            questionLabel.topAnchor.constraint(equalTo: QImageView.bottomAnchor ),
            questionLabel.heightAnchor.constraint(equalToConstant: 60),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            optionA.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 5),
            optionA.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            optionA.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            optionA.heightAnchor.constraint(equalToConstant: 70),
            
            optionB.topAnchor.constraint(equalTo: optionA.bottomAnchor, constant: 5),
            optionB.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            optionB.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            optionB.heightAnchor.constraint(equalToConstant: 70),
            
            optionC.topAnchor.constraint(equalTo: optionB.bottomAnchor, constant: 5),
            optionC.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            optionC.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            optionC.heightAnchor.constraint(equalToConstant: 70),
            
            optionD.topAnchor.constraint(equalTo: optionC.bottomAnchor, constant: 5),
            optionD.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            optionD.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            optionD.heightAnchor.constraint(equalToConstant: 70),
            
        ])
        
        
        let swiperight = UISwipeGestureRecognizer(
            target: self,
            action: #selector(QuitQuiz))
        swiperight.direction = .right
        view.addGestureRecognizer(swiperight)
        view.isUserInteractionEnabled = true
        
    }
    
    
    @objc private func QuitQuiz() {
        self.dismiss(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func answerPressed(_ sender: UIButton) {
        
        if sender.tag == selectedAnswer {
            //           ProgressHUD.showSuccess("Correct")
            print("Correct")
            score += 1
            
        }else{
            //           ProgressHUD.showError("Incorrect")
            print("Incorrect")
        }
        saveData()
        questionNumber += 1
        updateQuestion()
        updateUI()
        
    }
    func saveData() {
        
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("users/\(currentUserID)").updateData([
            "score" : score
      
        ])
    }
    
    func updateQuestion(){
        
        if questionNumber <= allQuestions.list.count - 1{
            QImageView.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
            questionLabel.text = allQuestions.list[questionNumber].question
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
            updateUI()
            
        }else {
            let alert = UIAlertController(title: "Awesome! Your score : \(score)", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            let endAction = UIAlertAction(title: "Exit", style: .default, handler: {action in self.QuitQuiz()})
          
            
            
           [ alert.addAction(restartAction) , alert.addAction(endAction) ]
            present(alert, animated: true, completion: nil)
            
            
//            present(alert, animated: true, completion: nil)
        }
        
        
    }
    func updateUI(){
        
        scoreLabel.text = "Score: \(score)"
        questionCounter.text = "Q:\(questionNumber + 1)/\(allQuestions.list.count )"
        
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
    
}


