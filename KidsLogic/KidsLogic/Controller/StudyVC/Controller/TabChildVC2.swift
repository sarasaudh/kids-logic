//
//  TabVC2.swift
//  KidsLogic
//
//  Created by sara saud on 05/05/1443 AH.
//

import Foundation

import UIKit

class TabVC2: UITabBarController {
   
    
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
      
     viewControllers = [

        createNavController(for:HoomeLessonsVC(), title: NSLocalizedString("Lesson", comment: ""), image: UIImage(systemName: "list.bullet.rectangle.fill")!),
      
        createNavController(for:MoreVC2(), title: NSLocalizedString("Evaluation", comment: ""), image: UIImage(systemName: "star")!),
        
       createNavController(for:MyProfileVC(), title: NSLocalizedString("profile", comment: ""), image: UIImage(systemName: "person")!),
     ]
   }
    
  override func viewDidLoad() {
      
    super.viewDidLoad()
      setupVCs()
 
      view.backgroundColor = UIColor (named: "DarkColor")
       
  }
   
}

