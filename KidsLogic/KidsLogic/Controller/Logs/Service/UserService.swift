//
//  UserService.swift
//  KidsLogic
//
//  Created by sara saud on 24/04/1443 AH.
//
import UIKit
import Foundation
import FirebaseFirestore


class UsersService {
  static let shared = UsersService()
  let usersCollection = Firestore.firestore().collection("users")
  func listenToUsers(completion: @escaping (([User]) -> Void)) {
    usersCollection.addSnapshotListener { snapshot, error in
      if error != nil {
        return
      }
      guard let docs = snapshot?.documents else {
        return
      }
      var users: [User] = []
      for doc in docs {
        let data = doc.data()
        guard
          let id = data["id"] as? String,
          let name = data["name"] as? String,
          let status = data["status"] as? String,
            let score = data["score"] as? Int,
          let image = data["image"] as? String
          else {
            continue
          }
        let user = User(
          id: id,
          name: name,
          status: status,
          score: score,
          image: image
        )
        users.append(user)
      }
      completion(users)
    }
  }
  func updateUserInfo(user: User) {
    usersCollection.document(user.id).setData([
      "id": user.id,
      "name": user.name,
      "status": user.status,
    ], merge: true)
  }
}
