//
//  More.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//
import WebKit
import Foundation

import UIKit
import SwiftUI

class MoreVC2: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kidPro")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .quaternaryLabel
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
lazy var levelOne: UIButton = {
    let level1 = UIButton()
    level1.translatesAutoresizingMaskIntoConstraints = false
    level1.setTitle(NSLocalizedString("GAME 🎮", comment: ""), for: .normal)
    level1.setTitleColor(.white, for: .normal)
    level1.backgroundColor = UIColor(#colorLiteral(red: 0.7047290802, green: 0.4141619802, blue: 0.5999490619, alpha: 0.8470588235))
    level1.layer.cornerRadius = 20
    level1.layer.masksToBounds = true
    level1.addTarget(self, action: #selector(GameButtonTapped), for: .touchUpInside)
    level1.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return level1
}()
    
    lazy var levelTwo: UIButton = {
        let level2 = UIButton()
        
        
        level2.translatesAutoresizingMaskIntoConstraints = false
        level2.setTitle(NSLocalizedString("Video 📀", comment: ""), for: .normal)
        level2.setTitleColor(.white, for: .normal)
        level2.backgroundColor = UIColor(#colorLiteral(red: 0.3279541135, green: 0.6508837342, blue: 0.8242474198, alpha: 0.8470588235) )
        
        level2.layer.cornerRadius = 20
        level2.layer.masksToBounds = true
        level2.addTarget(self, action: #selector(VedioButtonTapped), for: .touchUpInside)
        level2.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level2
    }()
    lazy var levelthree: UIButton = {
        let level3 = UIButton()
        
        
        level3.translatesAutoresizingMaskIntoConstraints = false
        level3.setTitle(NSLocalizedString("Carton 🧩", comment: ""), for: .normal)
        level3.setTitleColor(.white, for: .normal)
        level3.backgroundColor = UIColor( #colorLiteral(red: 0.4231500328, green: 0.6711993814, blue: 0.3329515457, alpha: 0.8470588235) )
        
        level3.layer.cornerRadius = 20
        level3.layer.masksToBounds = true
        level3.addTarget(self, action: #selector(TestButtonTapped), for: .touchUpInside)
        level3.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level3
    }()
    lazy var levelfour: UIButton = {
        let level4 = UIButton()
        
        
        level4.translatesAutoresizingMaskIntoConstraints = false
        level4.setTitle(NSLocalizedString("Self evaluation🔖 ", comment: ""), for: .normal)
        level4.setTitleColor(.white, for: .normal)
        level4.backgroundColor = UIColor( #colorLiteral(red: 1, green: 0.8552523255, blue: 0.642039299, alpha: 1))
        
        level4.layer.cornerRadius = 20
        level4.layer.masksToBounds = true
        level4.addTarget(self, action: #selector(diaryButtonTapped), for: .touchUpInside)
        level4.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level4
    }()
//    lazy var EdrakLearning: UIButton = {
//        let level4 = UIButton()
//
//        level4.translatesAutoresizingMaskIntoConstraints = false
//        level4.setTitle(NSLocalizedString("EdrakLearning 💎", comment: ""), for: .normal)
//        level4.setTitleColor(.white, for: .normal)
//        level4.backgroundColor = UIColor( #colorLiteral(red: 0.3914309144, green: 0.9054350257, blue: 0.9928495288, alpha: 1))
//
//        level4.layer.cornerRadius = 20
//        level4.layer.masksToBounds = true
//        level4.addTarget(self, action: #selector(CrunchZillaButtonTapped), for: .touchUpInside)
//        level4.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
//        return level4
//    }()
    
    var Swipelabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor =  .lightGray
//        lbl.backgroundColor = UIColor(#colorLiteral(red: 0.715143621, green: 0.4925160408, blue: 0.5837199092, alpha: 1))
         lbl.font.withSize(50)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = NSLocalizedString("Swipe To Quiz ", comment: "")
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
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant:10),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant:300),
        ])
        //dairy constraint
        view.addSubview(levelfour)
        NSLayoutConstraint.activate([
            
            levelfour.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelfour.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelfour.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelfour.heightAnchor.constraint(equalToConstant: 70),
        ])
        
        //Constraint loginButton
        view.addSubview(levelOne)
        NSLayoutConstraint.activate([
            levelOne.topAnchor.constraint(equalTo: levelfour.bottomAnchor,constant: 15),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            
            levelOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelOne.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        //Constraint registerButton
        view.addSubview(levelTwo)
        NSLayoutConstraint.activate([
            
            levelTwo.topAnchor.constraint(equalTo: levelOne.bottomAnchor, constant: 5),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelTwo.heightAnchor.constraint(equalToConstant: 50),
        ])
        view.addSubview(levelthree)
        NSLayoutConstraint.activate([
            
            levelthree.topAnchor.constraint(equalTo: levelTwo.bottomAnchor, constant: 5),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelthree.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelthree.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelthree.heightAnchor.constraint(equalToConstant: 50),
        ])
       
        
//        view.addSubview(EdrakLearning)
        view.addSubview(Swipelabel)
//        NSLayoutConstraint.activate([
//            EdrakLearning.topAnchor.constraint(equalTo: levelthree.bottomAnchor, constant: 5),
////            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),
//
//            EdrakLearning.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
//            EdrakLearning.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
//            EdrakLearning.heightAnchor.constraint(equalToConstant: 50),
//        ])
      
        NSLayoutConstraint.activate([
            

            Swipelabel.topAnchor.constraint(equalTo: levelthree.bottomAnchor, constant: 50),
            Swipelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Swipelabel.heightAnchor.constraint(equalToConstant: 20),
            
          
        ])
        let swipelift = UISwipeGestureRecognizer(
              target: self,
              action: #selector(openQuiz))
            swipelift.direction = .left
            view.addGestureRecognizer(swipelift)
            view.isUserInteractionEnabled = true
          
    }
     
            
@objc private func openQuiz() {
    let quizVC = QuizviewController()
    quizVC.modalPresentationStyle = .fullScreen
    self.present(quizVC, animated: true, completion: nil)
}

    @objc private func GameButtonTapped() {
let vc = Games2()
//        let vc = GameVC()
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func VedioButtonTapped() {
        let vc = Vedio()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    @objc private func TestButtonTapped() {
        let vc = VideoLessons()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    //test app
    @objc private func diaryButtonTapped() {
       
        let vc = TaskTabVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
//        let application = UIApplication.shared
//
//        let secondAppPath = "second1://"
//
//        let appUrl = URL(string: secondAppPath)!
//
//        let websiteUrl = URL(string: "")
//
//        if application.canOpenURL(appUrl) {
//
//            application.open(appUrl, options: [:], completionHandler: nil)
//
//        } else {
//
//            application.open(websiteUrl)
//
//        }
    
    @objc private func CrunchZillaButtonTapped() {
       
        let vc = crunchzilla()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    }


 




