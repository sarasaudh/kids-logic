//
//  prf.swift
//  KidsLogic
//
//  Created by sara saud on 12/05/1443 AH.
//

import Foundation

import UIKit
//import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
class ProfileVC: UIViewController {
  let db = Firestore.firestore()
//  let storage = Storage.storage()
  let profileImage: UIImageView = {
    let pI = UIImageView()
    pI.translatesAutoresizingMaskIntoConstraints = false
    pI.layer.cornerRadius = 45
    pI.isUserInteractionEnabled = true
    pI.contentMode = .scaleAspectFit
    pI.clipsToBounds = true
    pI.layer.borderColor = UIColor.white.cgColor
    pI.layer.borderWidth = 1
    return pI
  }()
}
