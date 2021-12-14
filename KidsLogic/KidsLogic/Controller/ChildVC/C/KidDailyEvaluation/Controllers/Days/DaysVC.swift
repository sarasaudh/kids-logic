//
//  DaysVC.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseFirestore

class DaysVC: UIViewController {
    var days: Array<Day> = []
    var taskCount = 0
    
    lazy var daysTV: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "DayCell")
        tv.setGradiantView3()
        return tv
    }()
    
    lazy var addDayButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(addDay), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(NSLocalizedString("NEW Day 🕚", comment: ""), for: .normal)
        b.backgroundColor = .systemMint
        b.layer.cornerRadius = 20
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DaysService.shared.listenToDays { newDays in
            self.days = newDays
            self.daysTV.reloadData()
        }
        TasksService.shared.listenToTasktCount { newTaskCount in
            self.taskCount = newTaskCount
            self.daysTV.reloadData()
        }
        
//        tabBarItem = UITabBarItem(title: "Days", image: UIImage(systemName: "calendar"), selectedImage:  UIImage(systemName: "calendar"))
//       
        view.backgroundColor = .gray
        
        view.addSubview(daysTV)
        NSLayoutConstraint.activate([
            daysTV.topAnchor.constraint(equalTo: view.topAnchor),
            daysTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            daysTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            daysTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(addDayButton)
        NSLayoutConstraint.activate([
            addDayButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
            addDayButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            addDayButton.widthAnchor.constraint(equalToConstant: 200),
            addDayButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func addDay() {
        let newDayVC = NewDayVC()
        present(newDayVC, animated: true, completion: nil)
    }
}


extension DaysVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "DayCell")
        
        let day = days[indexPath.row]
        let pStudentCount = day.pTasks 
            .count
        let aStudentCount = taskCount - pStudentCount
        
        cell.textLabel?.text = day.getNiceDate()
        cell.detailTextLabel?.text = " \(pStudentCount)  ✅ ➖  \(aStudentCount) ❎"
        
        return cell
    }
    //delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         let cell = days[indexPath.row]
         let alertcontroller = UIAlertController(title: "Delete Favorite Book"
                             , message: "Are you sure you want to delete this Book?"
                             , preferredStyle: UIAlertController.Style.alert
         )
            alertcontroller.addAction(
                UIAlertAction(title: "cancel",
                       style: UIAlertAction.Style.default,
                       handler: { Action in print("...")
           })
         )
         alertcontroller.addAction(
           UIAlertAction(title: "Delete",
                  style: UIAlertAction.Style.destructive,
                  handler: { Action in
             if editingStyle == .delete {
                 Firestore.firestore().collection("days").document(cell.id).delete()
             }
             self.daysTV.reloadData()
           })
         )
         self.present(alertcontroller, animated: true, completion: nil)
       }
     


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let day = days[indexPath.row]
        
        let navigationController = UINavigationController(
            rootViewController: DayTasksVC(dayId: day.id)
        )
        navigationController.navigationBar.prefersLargeTitles = true
        
        present(navigationController, animated: true, completion: nil)
    }
}
