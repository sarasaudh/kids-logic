//
//  More.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//
import WebKit
import Foundation
import FirebaseFirestore
import UIKit
import SwiftUI

class MoreVC2: UIViewController {
    
    // MARK: - properties
    var score = 0
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kidPro")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
    
    let imageNormal3:UIImage? = UIImage(named: "blue")
    let imageNormal2:UIImage? = UIImage(named: "red")
    
    
    lazy var levelthree: UIButton = {
        let level3 = UIButton()
        
        
        level3.translatesAutoresizingMaskIntoConstraints = false
        level3.setTitle(NSLocalizedString("Quiz 🧩", comment: ""), for: .normal)
        level3.setTitleColor(.systemBlue, for: .normal)
        level3.setBackgroundImage(imageNormal3, for: UIControl.State.normal)
        level3.layer.cornerRadius = 20
        level3.layer.masksToBounds = true
        level3.addTarget(self, action: #selector(openQuiz), for: .touchUpInside)
        
        level3.titleLabel?.font = UIFont(name:"Copperplate", size: 30)
        return level3
    }()
    
    
    lazy var levelfour: UIButton = {
        let level4 = UIButton()
        
        
        level4.translatesAutoresizingMaskIntoConstraints = false
        level4.setTitle(NSLocalizedString("Self evaluation🔖 ", comment: ""), for: .normal)
        level4.setTitleColor(.systemBlue, for: .normal)
        level4.setBackgroundImage(imageNormal2, for: UIControl.State.normal)
        level4.layer.cornerRadius = 20
        level4.layer.masksToBounds = true
        level4.addTarget(self, action: #selector(diaryButtonTapped), for: .touchUpInside)
        
        level4.titleLabel?.font = UIFont(name:"Copperplate", size: 30)
        return level4
    }()
    
    
    var Swipelabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor =  .lightGray
        lbl.font.withSize(50)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = NSLocalizedString("Swipe To Back 📽 ", comment: "")
        return lbl
    }()
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.setGradiantView2()
        
        
        //Constraint imageView
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant:70),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant:300),
        ])
        //dairy constraint
        view.addSubview(levelfour)
        NSLayoutConstraint.activate([
            
            levelfour.topAnchor.constraint(equalTo: imageView.bottomAnchor),
       
            
            levelfour.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            levelfour.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelfour.heightAnchor.constraint(equalToConstant: 100),
        ])
        
       
        
        view.addSubview(levelthree)
        NSLayoutConstraint.activate([
            
            levelthree.topAnchor.constraint(equalTo: levelfour.bottomAnchor, constant: 40),
           
            levelthree.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            levelthree.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelthree.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        
        view.addSubview(Swipelabel)
        
        NSLayoutConstraint.activate([
            
            
            Swipelabel.topAnchor.constraint(equalTo: levelthree.bottomAnchor, constant: 20),
            Swipelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Swipelabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        
        
        let swipelift = UISwipeGestureRecognizer(
            target: self,
            action: #selector(backButtonTapped))
        swipelift.direction = .left
        view.addGestureRecognizer(swipelift)
        view.isUserInteractionEnabled = true
        
    }

    @objc private func openQuiz() {
        let quizVC = QuizviewController()
        quizVC.modalPresentationStyle = .fullScreen
        self.present(quizVC, animated: true, completion: nil)
    }
    

    @objc private func VedioButtonTapped() {
        let vc = Vedio()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    @objc private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
   
    }
    
    
    
    //test app
    @objc private func diaryButtonTapped() {
        
        let vc = TaskTabVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
   
    
}





