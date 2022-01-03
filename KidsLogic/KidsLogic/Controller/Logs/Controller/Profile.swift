//
//  Profilee.swift
//  KidsLogic
//
//  Created by sara saud on 29/04/1443 AH.
//
import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore
import SwiftUI


class MyProfileVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate ,UITextFieldDelegate{
    
    var users: Array<User> = []
    var score:User?
    
    // MARK: - properties
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //    view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    //image picker
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(#colorLiteral(red: 0.3814536035, green: 0.5256128311, blue: 0.7803931832, alpha: 1))
        image.layer.cornerRadius = 50
        image.isUserInteractionEnabled = true
        return image
    }()
    //    lazy var imagePicker : UIImagePickerController = {
    //        let imagePicker = UIImagePickerController()
    //        imagePicker.delegate = self
    //        imagePicker.sourceType = .photoLibrary
    //        imagePicker.allowsEditing = true
    //        imagePicker.sheetPresentationController?.preferredCornerRadius = 50
    //        return imagePicker
    //    }()
    //user name
    lazy var nameLabel: UITextField = {
        let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.placeholder = (NSLocalizedString("name", comment: ""))
        label.textColor = .systemGray6
        label.borderStyle = .bezel
        label.textAlignment = .center
        
        return label
    }()
    lazy var usernameStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 16
        view.setGradiantView2()
        return view
    }()
    // user status
    lazy var userScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //      label.shadowColor = .blue
        label.font.withSize(100)
        label.backgroundColor = .quaternaryLabel
        //      label.text = NSLocalizedString("Score", comment: "")
        //      label.text = "SCORE"//(NSLocalizedString("score", comment: ""))
        label.textColor = .green
        //      label.borderStyle = .bezel
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        //      userScoreLabel.text = "1"
        return label
    }()
    //save the name and image and statuse
    
    let imageNormal2:UIImage? = UIImage(named: "Selver")
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle((NSLocalizedString("save", comment: "")), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith: .init(legibilityWeight: .bold))
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(SaveButtonTapped), for: .touchUpInside)
        button.layer.masksToBounds = true
        
        button.setBackgroundImage(imageNormal2, for: UIControl.State.normal)
        button.backgroundColor = UIColor(#colorLiteral(red: 0.3814536035, green: 0.5256128311, blue: 0.7803931832, alpha: 1))
        return button
    }()
    let imageNormal:UIImage? = UIImage(named: "score1")
    lazy var scoreButton: UIButton = {
        let button = UIButton (type: .system)
        
        button.setBackgroundImage(imageNormal, for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.addTarget(self, action: #selector(scorePressed), for: .touchUpInside)
        button.layer.masksToBounds = true
        return button
    }()
    
    //sing out from snap chat
    lazy var singOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle((NSLocalizedString("sign Out", comment: "")), for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont (forTextStyle: .headline, compatibleWith: .init(legibilityWeight: .bold))
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.addTarget(self, action: #selector(singOutButtonTapped), for: .touchUpInside)
        return button
    }()
    // stack view to sing out and share URL
    lazy var verticalStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.setGradiantView2()
        
        return view
    }()
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameLabel.resignFirstResponder()
        //        userScoreLabel.resignFirstResponder()
        return true
    }
    override func viewDidLoad () {
        super.viewDidLoad()
        
        
        //listener
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore()
            .document("users/\(currentUserID)")
            .addSnapshotListener{ doucument, error in
                if error != nil {
                    print (error as Any)
                    return
                }
                
                self.nameLabel.text = doucument?.data()?["First Name"] as? String
                self.userScoreLabel.text = "SCORE:\(doucument?.data()?["score"] as? Int ?? 0)"
                //                      "SCORE:  \(doucument?.data()?["score"] as! Int)"
                //                      let score = doucument?.data()?["score"] as? Int ?? 0
                //        self.userScoreLabel.text = "\(score)"
                
                let score = doucument?.data()?["score"] as? Int // else {return}
                
                switch score {
                case 1 :
                    self.profileImage.image = UIImage(named: "score1")
                case 2 :
                    self.profileImage.image = UIImage(named: "score2")
                case 3 :
                    self.profileImage.image = UIImage(named: "score3")
                case 4 :
                    self.profileImage.image = UIImage(named: "score4")
                case 5 :
                    self.profileImage.image = UIImage(named: "score5")
                case 6 :
                    self.profileImage.image = UIImage(named: "score6")
                case 7 :
                    self.profileImage.image = UIImage(named: "score7")
                    
                default :
                    self.profileImage.image = UIImage(named: "score1")
                    
                    //
                }
            }
        
        //if image level
        //      if userScoreLabel == 0 {
        //          profileImage.image = UIImage(named: "kidPro")
        ////
        //      }else if score?.score == 1 {
        //           profileImage.image = UIImage(named: "score")
        //      }else if score?.score == 2 {
        //           profileImage.image = UIImage(named: "forest")
        //      }
        //      if score?.score == 0 {
        //          profileImage.image = UIImage(named: "kidPro")
        //
        //      }else if score?.score == 1 {
        //           profileImage.image = UIImage(named: "score")
        //      }else if score?.score == 2 {
        //           profileImage.image = UIImage(named: "forest")
        //       }  }else if score?.score == 3 {
        //           profileImage.image = UIImage(named: "forest")
        //       }  }else if score?.score == 4 {
        //           profileImage.image = UIImage(named: "forest")
        //       }else if score?.score == 5 {
        //           profileImage.image = UIImage(named: "forest")
        //       }
        view.setGradiantView2()
        nameLabel.delegate = self
        //      userScoreLabel.delegate = self
        //            let image = UIImage(systemName: "person.crop.rectangle.fill")
        //            tabBarItem = .init(title: "profile", image: image, selectedImage: image)
        // Gesture to image
        
        
        //        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        //        profileImage.addGestureRecognizer(tapRecognizer)
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        
        containerView.addSubview (verticalStackView)
        
        verticalStackView.addArrangedSubview(profileImage)
        verticalStackView.addArrangedSubview (nameLabel)
        verticalStackView.addArrangedSubview(usernameStackView)
        //    usernameStackView.addArrangedSubview (userScoreLabel)
        verticalStackView.addArrangedSubview(saveButton)
        verticalStackView.addArrangedSubview(scoreButton)
        verticalStackView.addArrangedSubview(singOutButton)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 500),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint (equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 6),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: containerView.trailingAnchor, multiplier: 6),
            verticalStackView.topAnchor.constraint(equalToSystemSpacingBelow: containerView.topAnchor, multiplier: 2),
            verticalStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: containerView.leadingAnchor, multiplier: 6),
            containerView.trailingAnchor.constraint(equalToSystemSpacingAfter: verticalStackView.trailingAnchor, multiplier: 6),
            containerView.bottomAnchor.constraint (equalToSystemSpacingBelow: verticalStackView.bottomAnchor, multiplier: 3),
            profileImage.heightAnchor.constraint (equalToConstant: 200),
            profileImage.widthAnchor.constraint(equalToConstant: 200),
        ])
        view.addSubview(scoreButton)
        
        NSLayoutConstraint.activate([
            //        scoreButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            //        scoreButton.leftAnchor.constraint(equalTo: MapButton.rightAnchor, constant: 50),
            scoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreButton.topAnchor.constraint(equalTo: singOutButton.bottomAnchor, constant: 10),
            scoreButton.widthAnchor.constraint(equalToConstant: 50),
            scoreButton.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
        view.addSubview(userScoreLabel)
        NSLayoutConstraint.activate([
            userScoreLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            userScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            userScoreLabel.heightAnchor.constraint(equalToConstant: 40),
            userScoreLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        //    guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        
        RegisterService.shared.listenToUsers { ubdateUser in
            self.users = ubdateUser
        }
        
        //      guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        //      let uuid = UUID().uuidString
        //              Firestore.firestore()
        //                  .document("uuid")
        //                  .addSnapshotListener{ doucument, error in
        //                      if error != nil {
        //                          print (error)
        //                          return
        //                      }
        //
        //                      self.nameLabel.text = doucument?.data()?["name"] as? String
        //                      self.userStatusLabel.text = doucument?.data()?["status"] as? String
        ////                      self.profileImage.image = doucument?.data()?["image"] as? Image
        //
        //
        //                  }
        
    }
    //sing out from snap chat
    @objc private func singOutButtonTapped() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
        self.dismiss(animated: true, completion: nil)
        //    present(LoginVC(), animated: true, completion: nil)
    }
    //update name , image , status in fire store
    @objc private func SaveButtonTapped() {
        
        //      guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        let id = UUID().uuidString
        RegisterService.shared.addUser(user: User(
            id: id,
            name: nameLabel.text ?? "d",
            status: userScoreLabel.text ?? "d",
            score:  1,
            image: "\(profileImage.image)" ))
        
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("users/\(currentUserID)").updateData([
            //        "id" : currentUserID,
            "First Name" : nameLabel.text ?? "",
            //        "score" :  userScoreLabel.text ?? "",
            //      "status" :userScoreLabel.text,
            //      "image":"\(profileImage.image)"
        ])
        let alert1 = UIAlertController(
            title: ("Saved"),message: "Saved update data",preferredStyle: .alert)
        alert1.addAction(UIAlertAction(title: "OK",style: .default,handler: { action in
            print("OK")
        }
                                      )
        )
        present(alert1, animated: true, completion: nil)
    }
    //    //image picker
    //    @objc func imageTapped() {
    //        print("Image tapped")
    //        present(imagePicker, animated: true)
    //    }
    //    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //        let image = info[.editedImage] ?? info [.originalImage] as? UIImage
    //        profileImage.image = image as? UIImage
    //        dismiss(animated: true)
    //    }
    //share
    @objc func scorePressed (_ sender: Any) {
        
        let vc = ScoreViewController()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
        
        
    }
}
