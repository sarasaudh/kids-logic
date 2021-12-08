//
//  DailyTask.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import UIKit

class DTasksVC: UIViewController {
    var tasks: Array<Tasks> = []

    lazy var tasksTV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
        return t
    }()
    
    lazy var addTaskButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("NEW Task➕", for: .normal)
        b.backgroundColor = .systemMint
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradiantView3()
        TasksService.shared.listenToStudents { newTasks in
            self.tasks = newTasks
            self.tasksTV.reloadData()
        }
        
        tabBarItem = UITabBarItem(title: "My Task", image: UIImage(systemName: "target"), selectedImage: nil)
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
            addTaskButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -200),
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
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletAction = UIContextualAction(style: .destructive, title: "DELETE",handler: { [self]
            (ac:UIContextualAction,view:UIView,success:(Bool)->Void)in
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            success(true)
            
        } )
//deleteAction.backgroundColor = .systemPink
        return
        UISwipeActionsConfiguration(actions: [deletAction])
           
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
