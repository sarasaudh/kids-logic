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
  
class HomeVC: UIViewController {
    
    let imageNormal2:UIImage? = UIImage(named: "red")
    let imageNormal:UIImage? = UIImage(named: "burble")

    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kids")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .quaternaryLabel
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
lazy var GameButton: UIButton = {
    let level1 = UIButton()
    level1.translatesAutoresizingMaskIntoConstraints = false
    level1.setTitle(NSLocalizedString("GAME 🎮", comment: ""), for: .normal)
    level1.setBackgroundImage(imageNormal, for: UIControl.State.normal)
    level1.titleLabel?.font = UIFont(name:"Copperplate", size: 50)
    level1.setTitleColor(.systemGray4, for: .normal)
//    level1.backgroundColor = UIColor(#colorLiteral(red: 0.7047290802, green: 0.4141619802, blue: 0.5999490619, alpha: 0.8470588235))
    level1.layer.cornerRadius = 20
    level1.layer.masksToBounds = true
    level1.addTarget(self, action: #selector(GameButtonTapped), for: .touchUpInside)
//    level1.titleLabel?.font = .systemFont(ofSize: 40, weight: .medium)
    return level1
}()

    lazy var CartonButton: UIButton = {
        let level3 = UIButton()
        
        
        level3.translatesAutoresizingMaskIntoConstraints = false
        level3.setTitle(NSLocalizedString("Carton 🧩", comment: ""), for: .normal)
        level3.setBackgroundImage(imageNormal2
                                  , for: UIControl.State.normal)
        level3.setTitleColor(.systemGray4, for: .normal)
//        level3.backgroundColor = UIColor(  #colorLiteral(red: 0.7520335913, green: 0.6473677754, blue: 0.5675167441, alpha: 1) )
        
        level3.layer.cornerRadius = 20
        level3.layer.masksToBounds = true
        level3.addTarget(self, action: #selector(TestButtonTapped), for: .touchUpInside)
        level3.titleLabel?.font = UIFont(name:"Copperplate", size: 50)
        return level3
    }()

    lazy var baackButton: UIButton = {
        let btn = UIButton()
        
        
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setTitle(NSLocalizedString("Back", comment: ""), for: .normal)
        btn.setImage(UIImage(named: "back"), for: UIControl.State.normal)
        btn.setTitleColor(.red , for: .normal)
//        level3.backgroundColor = UIColor(  #colorLiteral(red: 0.7520335913, green: 0.6473677754, blue: 0.5675167441, alpha: 1) )
        
//        level3.layer.cornerRadius = 20
//        level3.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 40, weight: .medium)
        return btn
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
        //Constraint GameButton
        view.addSubview(GameButton)
        NSLayoutConstraint.activate([
            GameButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            GameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            GameButton.heightAnchor.constraint(equalToConstant: 100),
            GameButton.widthAnchor.constraint(equalToConstant: 300),
        ])
        

        view.addSubview(CartonButton)
        NSLayoutConstraint.activate([
            
            CartonButton.topAnchor.constraint(equalTo: GameButton.bottomAnchor, constant: 50),
            CartonButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            CartonButton.heightAnchor.constraint(equalToConstant: 100),
            CartonButton.widthAnchor.constraint(equalToConstant: 300),
        ])

        
        view.addSubview(baackButton)
        NSLayoutConstraint.activate([
            
            baackButton.topAnchor.constraint(equalTo: CartonButton.bottomAnchor, constant: 100),
            baackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            baackButton.heightAnchor.constraint(equalToConstant: 50),
            baackButton.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        
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
    @objc private func VideoButtonTapped() {
       
        let vc = TaskTabVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
        
    }

    @objc private func backButtonTapped() {
    self.dismiss(animated: true, completion: nil)
    }


}



