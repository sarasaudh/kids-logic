//
//  DailyTask.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import UIKit
import FirebaseFirestore
class DTasksVC: UIViewController {
    var tasks: Array<Tasks> = []
    
    // MARK: - properties
    lazy var tasksTV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
        t.setGradiantView3()
        return t
    }()
    
    lazy var addTaskButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(NSLocalizedString("NEW Task➕", comment: ""), for: .normal)
        b.backgroundColor = .systemMint
        b.layer.cornerRadius = 20
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradiantView3()
        TasksService.shared.listenToTasks { newTasks in
            self.tasks = newTasks
            self.tasksTV.reloadData()
        }
        
        view.backgroundColor = .white
        
        view.addSubview(tasksTV)
        NSLayoutConstraint.activate([
            tasksTV.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            tasksTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            tasksTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            tasksTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(addTaskButton)
        NSLayoutConstraint.activate([
            addTaskButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
            addTaskButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            addTaskButton.widthAnchor.constraint(equalToConstant: 200),
            addTaskButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    //add
    @objc func addTask() {
        let newTaskVC = NewTaskVC()
        present(newTaskVC, animated: true, completion: nil)
    }
    //delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let cell = tasks[indexPath.row]
        let alertcontroller = UIAlertController(title: "Delete Task"
                                                , message: "Are you sure you want to delete this Task?"
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
                                  Firestore.firestore().collection("tasks").document(cell.id).delete()
                              }
                              self.tasksTV.reloadData()
                          })
        )
        self.present(alertcontroller, animated: true, completion: nil)
    }
}

extension DTasksVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        let task = tasks[indexPath.row]
        
        cell.textLabel?.text = task.name
        
        return cell
    }
}
