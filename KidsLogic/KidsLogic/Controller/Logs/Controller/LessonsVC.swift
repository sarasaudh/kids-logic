//
//  LessonsVC.swift
//  KidsLogic
//
//  Created by sara saud on 26/05/1443 AH.
//

import Foundation
import WebKit
import Foundation

import UIKit

class HoomeLessonsVC: UIViewController {
    
    let imageNormal2:UIImage? = UIImage(named: "yallwo")
    let imageNormal:UIImage? = UIImage(named: "burble")
    
    // MARK: - properties
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "read")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
    lazy var readButton: UIButton = {
        let level1 = UIButton()
        level1.translatesAutoresizingMaskIntoConstraints = false
        level1.setTitle(NSLocalizedString("READ 📖", comment: ""), for: .normal)
        level1.setBackgroundImage(imageNormal, for: UIControl.State.normal)
        level1.titleLabel?.font = UIFont(name:"Copperplate", size: 50)
        level1.setTitleColor(.systemGray4, for: .normal)
        level1.layer.cornerRadius = 20
        level1.layer.masksToBounds = true
        level1.addTarget(self, action: #selector(readButtonTapped), for: .touchUpInside)
        return level1
    }()
    
    lazy var VideoButton: UIButton = {
        let level3 = UIButton()
        
        
        level3.translatesAutoresizingMaskIntoConstraints = false
        level3.setTitle(NSLocalizedString("WACH 🎞 ", comment: ""), for: .normal)
        level3.setBackgroundImage(imageNormal2
                                  , for: UIControl.State.normal)
        level3.setTitleColor(.systemGray4, for: .normal)
        level3.layer.cornerRadius = 20
        level3.layer.masksToBounds = true
        level3.addTarget(self, action: #selector(VedioButtonTapped), for: .touchUpInside)
        level3.titleLabel?.font = UIFont(name:"Copperplate", size: 50)
        return level3
    }()
    
    lazy var baackButton: UIButton = {
        let btn = UIButton()
        
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back"), for: UIControl.State.normal)
        btn.setTitleColor(.red , for: .normal)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 40, weight: .medium)
        return btn
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradiantView2()
        
        
        //Constraint imageView
        
        view.addSubview(imageView)
        
        // MARK: - constraint
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant:70),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant:300),
        ])
        //Constraint GameButton
        view.addSubview(readButton)
        NSLayoutConstraint.activate([
            readButton.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            readButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            readButton.heightAnchor.constraint(equalToConstant: 100),
            readButton.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        
        view.addSubview(VideoButton)
        NSLayoutConstraint.activate([
            
            VideoButton.topAnchor.constraint(equalTo: readButton.bottomAnchor, constant: 40),
            VideoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            VideoButton.heightAnchor.constraint(equalToConstant: 100),
            VideoButton.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        
        view.addSubview(baackButton)
        NSLayoutConstraint.activate([
            
            baackButton.topAnchor.constraint(equalTo: VideoButton.bottomAnchor, constant: 100),
            baackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            baackButton.heightAnchor.constraint(equalToConstant: 50),
            baackButton.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        
    }
    
    // MARK: - func
    
    @objc private func readButtonTapped() {
        let rootVC = Lessons()
        rootVC.title = "Read Lseeon"
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        
        present(navVC,animated: true)
    }
    
    @objc private func TestButtonTapped() {
        let vc = VideoLessons()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    //Videoapp
    
    @objc private func VedioButtonTapped() {
        let vc = Vedio()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    @objc private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.navigationBar.backgroundColor = .quaternarySystemFill
        
        return navController
    }
    
    func setupVCs() {
        
        createNavController(for:Lessons(), title: NSLocalizedString("Lesson", comment: ""), image: UIImage(systemName: "list.bullet.rectangle.fill")!)
        
        
    }
    
    
    
}
