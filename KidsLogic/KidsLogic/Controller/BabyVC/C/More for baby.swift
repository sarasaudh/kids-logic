//
//  More for baby.swift
//  KidsLogic
//
//  Created by sara saud on 05/05/1443 AH.
//

import Foundation
import WebKit
import Foundation

import UIKit

class MoreVC: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kids")
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
        //Constraint loginButton
        view.addSubview(levelOne)
        NSLayoutConstraint.activate([
            levelOne.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            
            levelOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelOne.heightAnchor.constraint(equalToConstant: 100),
        ])
        

        view.addSubview(levelthree)
        NSLayoutConstraint.activate([
            
            levelthree.topAnchor.constraint(equalTo: levelOne.bottomAnchor, constant: 10),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelthree.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelthree.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelthree.heightAnchor.constraint(equalToConstant: 100),
        ])

            }
    
    @objc private func GameButtonTapped() {
let vc = Games()
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
    @objc private func VideoButtonTapped() {
       
        let vc = TaskTabVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }

    }


 



