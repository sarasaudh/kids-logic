//
//  TaskTabVc.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import Foundation

import Foundation
import UIKit


class TaskTabVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        viewControllers = [
            DTasksVC(),DaysVC()
           
        ]
    }
}
