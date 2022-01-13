//
//  HomeSection.swift
//  KidsLogic
//
//  Created by sara saud on 09/06/1443 AH.
//
import UIKit
import Foundation

protocol HomeViewControllerDelegate: AnyObject{
    func didTapMenuButton()
}

class SettingHomeVC: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "infos")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 3
        
        return imageView
    }()
    
    override func viewDidLoad() {
         super.viewDidLoad()
 
        view.backgroundColor = UIColor(  #colorLiteral(red: 0.6398785114, green: 0.8450550437, blue: 0.9822372794, alpha: 1))
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            imageView.widthAnchor.constraint(equalToConstant: 600),
//            imageView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        view.backgroundColor = .systemBackground
         title = "Information"

    navigationItem.leftBarButtonItem = UIBarButtonItem(
                                        image: UIImage(systemName: "list.dash"),
                                        style: .done,
                                        target: self,
                                        action: #selector(didTapMenuButton))
        }
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
}
}
