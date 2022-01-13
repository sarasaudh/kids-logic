//
//  Setting.swift
//  KidsLogic
//
//  Created by sara saud on 08/06/1443 AH.
//

import Foundation
import UIKit
class settingVc:UIViewController {
    let imageNormalL:UIImage? = UIImage(named: "en")
    
    @objc lazy var changeLanguge: UIButton = {
        let btn = UIButton()
        
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(imageNormalL, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(ChangeLanguge), for: .touchUpInside)
        btn.layer.masksToBounds = true
        btn.titleLabel?.textAlignment = .center
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.background.
        view.backgroundColor = .white
        view.addSubview(changeLanguge)
        NSLayoutConstraint.activate([
            
            changeLanguge.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            changeLanguge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeLanguge.heightAnchor.constraint(equalToConstant: 80),
            changeLanguge.widthAnchor.constraint(equalToConstant: 80),
        ])
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
}

