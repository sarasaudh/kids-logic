//
//  Container.swift
//  KidsLogic
//
//  Created by sara saud on 09/06/1443 AH.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import WebKit
import MessageUI

class ContainerViewController: UIViewController, MFMailComposeViewControllerDelegate {

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
    
    let backImg:UIImage? = UIImage(named: "blue")
    lazy var backBTN: UIButton = {
            let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(NSLocalizedString("Back", comment: ""), for: .normal)
        btn.setBackgroundImage(backImg, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont(name:"Copperplate", size: 50)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
           
            return btn
        }()
    
  
//    MARK: - Menu
    
    enum MenuState {
        case opened
        case closed
    }
    private var menuState: MenuState = .closed
    lazy var mapVC = MapViewController()
    let menuVC = MenuViewController()
    let homeVC = SettingHomeVC()
    var navVC: UINavigationController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(  #colorLiteral(red: 0.6398785114, green: 0.8450550437, blue: 0.9822372794, alpha: 1))

        addChildVCs()
        
//MARK: - section 
        view.setGradiantView3()
        title = "Section"
        // MARK: - Constraints
        
        view.addSubview(imageView)
        view.addSubview(backBTN)
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            
            
            backBTN.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            backBTN.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            backBTN.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            backBTN.widthAnchor.constraint(equalToConstant: 200),
            backBTN.heightAnchor.constraint(equalToConstant: 70),
            
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
    
    
    @objc func ChangeLanguge() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
  
    
    
    
    private func addChildVCs () {
//         Menu
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
//         Home
        
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
}

extension ContainerViewController: HomeViewControllerDelegate{
    func didTapMenuButton() {
        toggleMenu(completion: nil)
    }
    func toggleMenu(completion: (() -> Void)?){
        //animate the menu
        
        switch menuState {
        case .closed:
            //open it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut) {

                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100

            }completion: { [weak self] done in
                if done{
                    self?.menuState = .opened
                 
                }
            }

        case .opened:
            //close it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut) {

                self.navVC?.view.frame.origin.x = 0

            }completion: { [weak self] done in
                if done{
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
        }
    }
}
    }
}

extension ContainerViewController: MenuViewControllerDelegate{
    
    func didSelect(menuItem: MenuViewController.MenuOption) {
        print("did select ")
        toggleMenu(completion: nil)
            switch menuItem{
            case .info:
                self.restToHome()
                
           
                
            case .darkMode:
            DarkMode()
                
            case .lightMode:
                LightMode()
                
                
            case .languge:
                ChangeLanguge()
                
                
            case .location:
                self.addInfo()
                
                
                let vc = mapVC
                self.present(UINavigationController(rootViewController: vc),animated: true,completion: nil)
                
                
            case .contact:
                self.callNumber(phoneNumber: "+966509501148")


            case .email:
                sendMail()
                
            case .website:
                LinkPressed()

            case .singout:
                singOutButtonTapped()

        
            }
    }
    
        private func callNumber(phoneNumber:String) {
           if let phoneCallURL = URL(string: "tel://\(+966509501148)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
              application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
           }
          }
        
    
    @objc func back() {
        //add map child
        _ = SectionVC()
        dismiss(animated: true) {
          
        }
    }
    
    func DarkMode() {

                let appDelegate = UIApplication.shared.windows.first
                  appDelegate?.overrideUserInterfaceStyle = .dark
               
    }
    func LightMode() {
        let appDelegate = UIApplication.shared.windows.first
        appDelegate?.overrideUserInterfaceStyle = .light
      
    }
    func addInfo() {
        //add map child
               let vc = mapVC
      
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC )
        homeVC.title = vc.title
    }
    
    func sendMail(){
        if MFMailComposeViewController.canSendMail() {
               let mail = MFMailComposeViewController()
               mail.mailComposeDelegate = self
               mail.setToRecipients(["sarasaud379@gmail.com"])
               mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

               present(mail, animated: true)
           } else {
               // show failure alert
           }
    }
    func restToHome(){
        mapVC.view.removeFromSuperview()
        
        mapVC.didMove(toParent: nil )
        homeVC.title = "Aboute App"
    }

    
    @objc func singOutButtonTapped() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
//            dismiss(animated: true, completion: nil)
            
            let vc = LoginVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
    @objc private func LinkPressed() {
        UIApplication.shared.openURL(NSURL(string: "https://sites.google.com/view/kidslogic/home")! as URL)
    }
}
