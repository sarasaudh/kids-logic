//
//  TaskTabVc.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//
import Foundation

import UIKit

class TaskTabVC: UITabBarController {
   
    
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

        createNavController(for:DTasksVC(), title: NSLocalizedString("Tasks", comment: ""), image: UIImage(systemName: "target")!),
      
        createNavController(for:DaysVC(), title: NSLocalizedString("Days", comment: ""), image: UIImage(systemName: "calendar")!),
        
     
     ]
   }
    
  override func viewDidLoad() {
      
    super.viewDidLoad()
      setupVCs()
 
      view.backgroundColor = UIColor (named: "DarkColor")
       
  }
   
}



//import Foundation
//
//import Foundation
//import UIKit
//
//
//class TaskTabVC: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//        viewControllers = [
//            DTasksVC(),DaysVC()
//
//            tabBarItem = UITabBarItem(title: "Days", image: UIImage(systemName: "calendar"), selectedImage:  UIImage(systemName: "calendar"))
//
//            tabBarItem = UITabBarItem(title: "My Task", image: UIImage(systemName: "target"), selectedImage: nil)
//
//        ]
//    }
//}
