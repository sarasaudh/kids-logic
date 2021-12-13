//
//  Games.swift
//  KidsLogic
//
//  Created by sara saud on 03/05/1443 AH.
//

import Foundation
import UIKit
class Games:UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pandaPlay")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .quaternaryLabel
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
   var honyGameName: UILabel = {
      let lbl = UILabel()
       lbl.textAlignment = .center
       lbl.textColor =  .black
      lbl.shadowColor = .lightGray
//       lbl.backgroundColor = UIColor(#colorLiteral(red: 0.715143621, green: 0.4925160408, blue: 0.5837199092, alpha: 1))
        lbl.font.withSize(15)
       lbl.translatesAutoresizingMaskIntoConstraints = false
       lbl.text = NSLocalizedString("honey bee Game", comment: "")
        return lbl
        
   }()
  
lazy var honyboo: UIButton = {
    let btn = UIButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
//    btn.setTitle(NSLocalizedString("", comment: ""), for: .normal)
    btn.setImage(UIImage(named: "h"), for: UIControl.State.normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = UIColor(#colorLiteral(red: 0.7047290802, green: 0.4141619802, blue: 0.5999490619, alpha: 0.8470588235))
    btn.layer.cornerRadius = 20
    btn.layer.masksToBounds = true
    btn.addTarget(self, action: #selector(honyBeeTapped), for: .touchUpInside)
    btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return btn
}()
  
    
    var GoldenFishName: UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor =  .black
       lbl.shadowColor = .lightGray
//        lbl.backgroundColor = UIColor(#colorLiteral(red: 0.4051097035, green: 0.6975014806, blue: 0.8082057238, alpha: 1) )
         lbl.font.withSize(15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = NSLocalizedString("GoldenFish", comment: "")
         return lbl
         
    }()
    
    lazy var game3: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setTitle(NSLocalizedString("Golden Fish", comment: ""), for: .normal)
        btn.setImage(UIImage(named: "startFish"), for: UIControl.State.normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(#colorLiteral(red: 0.3279541135, green: 0.6508837342, blue: 0.8242474198, alpha: 0.8470588235) )
        
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(GoldenFishTapped), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradiantView3()
        view.addSubview(imageView)
        view.addSubview(honyboo)
        view.addSubview(honyGameName)
//        view.addSubview(game2)
//        view.addSubview(MonkyGameName)
        view.addSubview(GoldenFishName)
        view.addSubview(game3)
       
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant:300),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            
            
            honyboo.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant:20),
            honyboo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            honyboo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            honyboo.heightAnchor.constraint(equalToConstant: 100),
           
        
            honyGameName.topAnchor.constraint(equalTo: honyboo.bottomAnchor, constant:10),
            honyGameName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            honyGameName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            
           
            
            game3.topAnchor.constraint(equalTo: honyGameName.bottomAnchor, constant: 60),
            game3.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            game3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            game3.heightAnchor.constraint(equalToConstant: 100),
      
            GoldenFishName.topAnchor.constraint(equalTo: game3.bottomAnchor, constant:10),
            GoldenFishName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            GoldenFishName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
      
        ])
     
}
    @objc private func honyBeeTapped() {
let vc = honyBeeGame()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

    @objc private func GoldenFishTapped() {
        let vc = GoldenFishGame()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
