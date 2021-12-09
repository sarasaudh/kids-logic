//
//  grade.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import UIKit

class GradeVC: UIViewController {

    
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "panda2")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 3
        
        return imageView
    }()
    lazy var level1Image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "baby")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    lazy var level2Image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kid")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 3
        
        return imageView
    }()
    
    lazy var levelsLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false

         lbl.textAlignment = .center
          lbl.textColor = .white
         lbl.shadowColor = .black
          lbl.font.withSize(100)
         lbl.translatesAutoresizingMaskIntoConstraints = false
         lbl.text = NSLocalizedString("How Old Are You ?", comment: "")
          return lbl
            
    }()
lazy var levelOne: UIButton = {
    let level1 = UIButton()
    level1.translatesAutoresizingMaskIntoConstraints = false
    level1.setTitle(NSLocalizedString("younger than 6 years old", comment: ""), for: .normal)
    level1.setTitleColor(.white, for: .normal)
    level1.backgroundColor = UIColor(#colorLiteral(red: 0.8162642121, green: 0.6648833156, blue: 0.7066509128, alpha: 1))
    level1.layer.cornerRadius = 20
    level1.layer.masksToBounds = true
    level1.addTarget(self, action: #selector(level1ButtonTapped), for: .touchUpInside)
    level1.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return level1
}()
    
    lazy var levelTwo: UIButton = {
        let level2 = UIButton()
        
        
        level2.translatesAutoresizingMaskIntoConstraints = false
        level2.setTitle(NSLocalizedString("7 years and older", comment: ""), for: .normal)
        level2.setTitleColor(.white, for: .normal)
        level2.backgroundColor = UIColor(#colorLiteral(red: 0.8785117269, green: 0.7318091393, blue: 0.647349894, alpha: 1))
        level2.addTarget(self, action: #selector(level2ButtonTapped), for: .touchUpInside)
        level2.layer.cornerRadius = 20
        level2.layer.masksToBounds = true

        level2.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level2
    }()
//    lazy var levelthree: UIButton = {
//        let level3 = UIButton()
//
//
//        level3.translatesAutoresizingMaskIntoConstraints = false
//        level3.setTitle(NSLocalizedString("Level 3 ", comment: ""), for: .normal)
//        level3.setTitleColor(.white, for: .normal)
//        level3.backgroundColor = .lightGray
//
//        level3.layer.cornerRadius = 20
//        level3.layer.masksToBounds = true
//
//        level3.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
//        return level3
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradiantView2()
        
        
        //Constraint imageView
        
        view.addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        // constrant label
        view.addSubview(levelsLabel)
        NSLayoutConstraint.activate([
            levelsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),

            levelsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            levelsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelsLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        
        
        //Constraint loginButton
        view.addSubview(levelOne)
        NSLayoutConstraint.activate([
            levelOne.topAnchor.constraint(equalTo: levelsLabel.bottomAnchor, constant: 20),

            levelOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90),
            levelOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelOne.heightAnchor.constraint(equalToConstant: 50),
        ])
        view.addSubview(level1Image)
        NSLayoutConstraint.activate([
            level1Image.topAnchor.constraint(equalTo: levelsLabel.bottomAnchor, constant: 20),

            level1Image.rightAnchor.constraint(equalTo: levelOne.rightAnchor, constant:100),
//            level1Image.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            level1Image.heightAnchor.constraint(equalToConstant: 70),
        ])
        //Constraint registerButton
        view.addSubview(levelTwo)
        NSLayoutConstraint.activate([
            
            levelTwo.topAnchor.constraint(equalTo: levelOne.bottomAnchor, constant: 20),

            levelTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90),
            levelTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelTwo.heightAnchor.constraint(equalToConstant: 50),
        ])
        view.addSubview(level2Image)
        NSLayoutConstraint.activate([
            level2Image.topAnchor.constraint(equalTo: level1Image.bottomAnchor),

            level2Image.rightAnchor.constraint(equalTo: levelTwo.rightAnchor, constant:150),
//            level1Image.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            level2Image.heightAnchor.constraint(equalToConstant: 70),
        ])
//        view.addSubview(levelthree)
//        NSLayoutConstraint.activate([
//
//            levelthree.topAnchor.constraint(equalTo: levelTwo.bottomAnchor, constant: 50),
//
//            levelthree.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
//            levelthree.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
//            levelthree.heightAnchor.constraint(equalToConstant: 100),
//        ])
            }
    
    @objc private func level1ButtonTapped() {
        let vc = TabVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @objc private func level2ButtonTapped() {
        let vc = TabVC2()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

    }

}

