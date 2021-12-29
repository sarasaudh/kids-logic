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
    var score = 0
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kidPro")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .quaternaryLabel
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
//lazy var levelOne: UIButton = {
//    let level1 = UIButton()
//    level1.translatesAutoresizingMaskIntoConstraints = false
//    level1.setTitle(NSLocalizedString("GAME 🎮", comment: ""), for: .normal)
//    level1.setTitleColor(.white, for: .normal)
//    level1.backgroundColor = UIColor(#colorLiteral(red: 0.7047290802, green: 0.4141619802, blue: 0.5999490619, alpha: 0.8470588235))
//    level1.layer.cornerRadius = 20
//    level1.layer.masksToBounds = true
//    level1.addTarget(self, action: #selector(GameButtonTapped), for: .touchUpInside)
//    level1.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
//    return level1
//}()
    
      let imageNormal3:UIImage? = UIImage(named: "yallwo")
    let imageNormal:UIImage? = UIImage(named: "blue")
    let imageNormal2:UIImage? = UIImage(named: "red")
    
    
    lazy var levelTwo: UIButton = {
        let level2 = UIButton()
        
        
        level2.translatesAutoresizingMaskIntoConstraints = false
        level2.setTitle(NSLocalizedString("Video 📀", comment: ""), for: .normal)
        level2.setTitleColor(.systemGray2, for: .normal)
//        level2.backgroundColor = UIColor(#colorLiteral(red: 0.3279541135, green: 0.6508837342, blue: 0.8242474198, alpha: 0.8470588235) )
        
        level2.setBackgroundImage(imageNormal, for: UIControl.State.normal)
        level2.layer.cornerRadius = 20
        level2.layer.masksToBounds = true
        level2.addTarget(self, action: #selector(VedioButtonTapped), for: .touchUpInside)
        
        level2.titleLabel?.font = UIFont(name:"Copperplate", size: 30)
        return level2
    }()
    lazy var levelthree: UIButton = {
        let level3 = UIButton()
        
        
        level3.translatesAutoresizingMaskIntoConstraints = false
        level3.setTitle(NSLocalizedString("Quiz 🧩", comment: ""), for: .normal)
        level3.setTitleColor(.systemGray2, for: .normal)
//        level3.backgroundColor = UIColor( #colorLiteral(red: 0.4231500328, green: 0.6711993814, blue: 0.3329515457, alpha: 0.8470588235) )
        
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
        level4.setTitleColor(.systemGray2, for: .normal)
//        level4.backgroundColor = UIColor(#colorLiteral(red: 0.5568159819, green: 0.5498092175, blue: 0.5621412396, alpha: 0.8470588235))
        
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
//        lbl.backgroundColor = UIColor(#colorLiteral(red: 0.715143621, green: 0.4925160408, blue: 0.5837199092, alpha: 1))
         lbl.font.withSize(50)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = NSLocalizedString("Swipe To Back 📽 ", comment: "")
        return lbl
    }()
//    var scorelabel: UILabel = {
//       let lbl = UILabel()
//        lbl.textColor =  .lightGray
////        lbl.backgroundColor = UIColor(#colorLiteral(red: 0.715143621, green: 0.4925160408, blue: 0.5837199092, alpha: 1))
//         lbl.font.withSize(50)
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = NSLocalizedString("your score \(showScore) ", comment: "")
//        return lbl
//    }()
    let MapImage:UIImage? = UIImage(named: "map")
    lazy var MapButton: UIButton = {
        let button = UIButton (type: .system)

        button.setBackgroundImage(MapImage, for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(MapPressed), for: .touchUpInside)
        button.layer.masksToBounds = true
        return button
    }()
//    lazy var baackButton: UIButton = {
//        let btn = UIButton()
//
//
//        btn.translatesAutoresizingMaskIntoConstraints = false
////        btn.setTitle(NSLocalizedString("Back", comment: ""), for: .normal)
//        btn.setImage(UIImage(named: "back"), for: UIControl.State.normal)
//        btn.setTitleColor(.red , for: .normal)
////        level3.backgroundColor = UIColor(  #colorLiteral(red: 0.7520335913, green: 0.6473677754, blue: 0.5675167441, alpha: 1) )
//
////        level3.layer.cornerRadius = 20
////        level3.layer.masksToBounds = true
//        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        btn.titleLabel?.font = .systemFont(ofSize: 40, weight: .medium)
//        return btn
//    }()
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

            levelfour.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            levelfour.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelfour.heightAnchor.constraint(equalToConstant: 70),
        ])
        
        //Constraint loginButton
//        view.addSubview(levelOne)
//        NSLayoutConstraint.activate([
//            levelOne.topAnchor.constraint(equalTo: levelfour.bottomAnchor,constant: 15),
////            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),
//
//            levelOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
//
//            levelOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
//            levelOne.heightAnchor.constraint(equalToConstant: 50),
//        ])
        
        //Constraint registerButton
        view.addSubview(levelTwo)
        NSLayoutConstraint.activate([
            
            levelTwo.topAnchor.constraint(equalTo: levelfour.bottomAnchor, constant: 20),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            levelTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelTwo.heightAnchor.constraint(equalToConstant: 70),
        ])
        view.addSubview(levelthree)
        NSLayoutConstraint.activate([
            
            levelthree.topAnchor.constraint(equalTo: levelTwo.bottomAnchor, constant: 20),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelthree.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            levelthree.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelthree.heightAnchor.constraint(equalToConstant: 70),
        ])
       
        
//        view.addSubview(EdrakLearning)
        view.addSubview(Swipelabel)
//        view.addSubview(scorelabel)
      
        NSLayoutConstraint.activate([
            

            Swipelabel.topAnchor.constraint(equalTo: levelthree.bottomAnchor, constant: 50),
            Swipelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Swipelabel.heightAnchor.constraint(equalToConstant: 20),
        ])
//            NSLayoutConstraint.activate([
//                scorelabel.topAnchor.constraint(equalTo: Swipelabel.bottomAnchor, constant: 50),
//                scorelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                scorelabel.heightAnchor.constraint(equalToConstant: 20),
                
      
            
        view.addSubview(MapButton)
        NSLayoutConstraint.activate([
     

        MapButton.topAnchor.constraint(equalTo: Swipelabel.bottomAnchor, constant: 30),
        MapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        MapButton.widthAnchor.constraint(equalToConstant: 50),
        MapButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        
//        view.addSubview(baackButton)
//        NSLayoutConstraint.activate([
//
//            baackButton.topAnchor.constraint(equalTo: Swipelabel.bottomAnchor, constant: 25),
//            baackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -30) ,
//            baackButton.heightAnchor.constraint(equalToConstant: 60),
//            baackButton.widthAnchor.constraint(equalToConstant: 60),
//        ])
        
        
        let swipelift = UISwipeGestureRecognizer(
              target: self,
              action: #selector(backButtonTapped))
            swipelift.direction = .left
            view.addGestureRecognizer(swipelift)
            view.isUserInteractionEnabled = true
          
    }
     
//    @objc func showScore() {
//        Firestore
//            .firestore()
//            .collection("users")
//            .whereField("score", isEqualTo: "user")
//            .addSnapshotListener { sanpshot, error in
//                if error != nil {
//                    print(error)
//                    return
//                }
//                let saved = sanpshot?.documents.first?.data()
//                let singleValue = (saved!["name"] ?? "nothing")
//                self.scorelabel.text = "\(String(describing: singleValue))"
//            }
//    }

@objc private func openQuiz() {
    let quizVC = QuizviewController()
    quizVC.modalPresentationStyle = .fullScreen
    self.present(quizVC, animated: true, completion: nil)
}

//    @objc private func GameButtonTapped() {
//let vc = Games2()
////        let vc = GameVC()
//        vc.modalPresentationStyle = .automatic
//        self.present(vc, animated: true, completion: nil)
//    }
    
    @objc private func VedioButtonTapped() {
        let vc = Vedio()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    @objc private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
//        let vc = VideoLessons()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    //test app
    @objc private func diaryButtonTapped() {
       
        let vc = TaskTabVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }

    @objc private func MapPressed() {
       
        let vc = MapViewController()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
  
}





