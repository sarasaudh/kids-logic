//
//  grade.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import UIKit

class SectionVC: UIViewController{
    
//    var isSlideInMenuPresented = false
//    lazy var slideInMenuPadding: CGFloat = self.view.frame.width * 0.30
//
//    lazy var menuBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(menuBarButtomItemTapped))
//
//    @objc
//    func menuBarButtomItemTapped() {
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
//            self.containerView.frame.origin.x = self.isSlideInMenuPresented ? 0 : self.containerView.frame.width - self.slideInMenuPadding
//        } completion: { (finished) in
//            print("Animation finished: \(finished)")
//            self.isSlideInMenuPresented.toggle()
//        }
//
//    }
    
    lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()


    @objc func menuBarButtomTapped(){
        

    }
    // MARK: - properties
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "panda2")
        imageView.contentMode = .scaleAspectFit
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
        lbl.textColor = .black
        lbl.shadowColor = .blue
        lbl.font.withSize(100)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = NSLocalizedString("Welcome ", comment: "")
        
        return lbl
    }()
    
    
    let imageNormal:UIImage? = UIImage(named: "button")
    
    lazy var levelOne: UIButton = {
        let level1 = UIButton()
        level1.translatesAutoresizingMaskIntoConstraints = false
        level1.setTitle(NSLocalizedString("PLAY", comment: ""), for: .normal)
        level1.setTitleColor(.white, for: .normal)
        level1.titleLabel?.font = UIFont(name:"Copperplate", size: 40 )
        level1.setBackgroundImage(imageNormal, for: UIControl.State.normal)
        level1.layer.masksToBounds = true
        level1.addTarget(self, action: #selector(level1ButtonTapped), for: .touchUpInside)
        
        return level1
    }()
    
    lazy var levelTwo: UIButton = {
        let level2 = UIButton()
        
        level2.translatesAutoresizingMaskIntoConstraints = false
        level2.setTitle(NSLocalizedString("STUDY", comment: ""), for: .normal)
        level2.setTitleColor(.white, for: .normal)
        
        level2.setBackgroundImage(imageNormal, for: UIControl.State.normal)
        level2.addTarget(self, action: #selector(level2ButtonTapped), for: .touchUpInside)
        level2.layer.masksToBounds = true
        level2.titleLabel?.font = UIFont(name:"Copperplate", size: 40)
        level2.titleLabel?.textAlignment = .center
        
        return level2
    }()
    
    let setting:UIImage? = UIImage(named: "setting")
    lazy var settingBtn: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setTitle(NSLocalizedString("Setting", comment: ""), for: .normal)
//        btn.setTitleColor(.white, for: .normal)
        
        btn.setBackgroundImage(setting, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(settingsBtnTap), for: .touchUpInside)
        btn.layer.masksToBounds = true
//        btn.titleLabel?.font = UIFont(name:"Copperplate", size: 40)
//        btn.titleLabel?.textAlignment = .center
        
        return btn
    }()
    
//    let imageNormalL:UIImage? = UIImage(named: "en")
//
//    @objc lazy var changeLanguge: UIButton = {
//        let btn = UIButton()
//
//
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setBackgroundImage(imageNormalL, for: UIControl.State.normal)
//        btn.addTarget(self, action: #selector(ChangeLanguge), for: .touchUpInside)
//        btn.layer.masksToBounds = true
//        btn.titleLabel?.textAlignment = .center
//
//        return btn
//    }()
    
    
    // MARK: - LoadView
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        title = "Side menu"
//        navigationItem.setLeftBarButton(menuBarButtonItem, animated: false)
//
//        menuView.pinMenuTo(view, with: slideInMenuPadding)
//        containerView.edgeTo(view)
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: -100))
//        view.addSubview(navBar)
//
//        let navItem = UINavigationItem(title: "Section")
//        let doneItem = UIBarButtonItem(image:UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(settingsBtnTap))//(barButtonSystemItem: .done, target: nil, action: #selector(settingsBtnTap))
//        navItem.rightBarButtonItem = doneItem
//
//        navBar.setItems([navItem], animated: false)
//
        
        view.setGradiantView3()
//        navigationItem.setLeftBarButton(menuBarBtn, animated: false)
        title = "Section"
        // MARK: - Constraints
        
        view.addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        // constrant label
        view.addSubview(levelsLabel)
        NSLayoutConstraint.activate([
            levelsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -80),
            
            levelsLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            levelsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelsLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        
        
        //Constraint loginButton
        view.addSubview(levelOne)
        NSLayoutConstraint.activate([
            levelOne.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 90),
            
            levelOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90),
            levelOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelOne.heightAnchor.constraint(equalToConstant: 100),
        ])
        view.addSubview(level1Image)
        NSLayoutConstraint.activate([
            level1Image.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 90),
            
            level1Image.rightAnchor.constraint(equalTo: levelOne.rightAnchor, constant:60),
            level1Image.heightAnchor.constraint(equalToConstant: 90),
        ])
        //Constraint registerButton
        view.addSubview(levelTwo)
        NSLayoutConstraint.activate([
            
            levelTwo.topAnchor.constraint(equalTo: levelOne.bottomAnchor, constant: 50),
            
            levelTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90),
            levelTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            levelTwo.heightAnchor.constraint(equalToConstant: 100),
        ])
        view.addSubview(level2Image)
        NSLayoutConstraint.activate([
            level2Image.topAnchor.constraint(equalTo: levelOne.bottomAnchor, constant: 50),
            
            level2Image.rightAnchor.constraint(equalTo: levelTwo.rightAnchor, constant:-70),
            level2Image.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        //        changeLanguge
//        view.addSubview(changeLanguge)
//        NSLayoutConstraint.activate([
//
//            changeLanguge.topAnchor.constraint(equalTo: level2Image.bottomAnchor, constant: 100),
//            changeLanguge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            changeLanguge.heightAnchor.constraint(equalToConstant: 80),
//            changeLanguge.widthAnchor.constraint(equalToConstant: 80),
//        ])
        
        
        view.addSubview(settingBtn)
        NSLayoutConstraint.activate([
            
            settingBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            settingBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -140),
            settingBtn.heightAnchor.constraint(equalToConstant: 40),
            settingBtn.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    // MARK: - func
    
    
    @objc private func level1ButtonTapped() {
        let vc = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @objc private func level2ButtonTapped() {
        let vc = TabVC2()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
//    @objc func ChangeLanguge() {
//        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
//            return
//        }
//        if UIApplication.shared.canOpenURL(settingsUrl) {
//            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
//                print("Settings opened: \(success)")
//            })
//        }
//    }
    
    @objc private func settingsBtnTap() {
        let vc = ContainerViewController()
        vc.modalPresentationStyle = .fullScreen
        let navItem = UINavigationItem(title: "Section")
//              let doneItem = UIBarButtonItem(image:UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(ChangeLanguge))//(barButtonSystemItem: .done, target: nil, action: #selector(settingsBtnTap))
//              navItem.rightBarButtonItem = doneItem
      
//              navBar.setItems([navItem], animated: false)
      
        vc.navigationItem
        self.present(vc, animated: true, completion: nil)
    }
    
//    public extension SectionVC {
//        func edgeTo(_ view: UIView) {
//            view.addSubview(self)
//            translatesAutoresizingMaskIntoConstraints = false
//            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        }
//
//        func pinMenuTo(_ view: UIView, with constant: CGFloat) {
//            view.addSubview(self)
//            translatesAutoresizingMaskIntoConstraints = false
//            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
//            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
////        }
//}
}
