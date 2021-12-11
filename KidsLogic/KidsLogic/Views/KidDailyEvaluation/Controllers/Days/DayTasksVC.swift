//
//  DayTasksVC.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import Foundation

import UIKit

class DayAttendanceVC: UIViewController {

    var dayId: String
    let cellId = "DayTasksCell"
    var day: Day?
    var tasks: Array<Tasks> = []
    
    init (dayId: String) {
        self.dayId = dayId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.dayId = ""
        super.init(coder: coder)
    }
    
    lazy var tasksTV: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tv
    }()
    lazy var pStudentsLabel = UILabel()
    lazy var aStudentsLabel = UILabel()
    lazy var labelStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            pStudentsLabel, aStudentsLabel
        ])
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NEW DAY"
        DaysService.shared.listenToDay(dayId: dayId) { newDay in
            self.day = newDay
            self.title = newDay?.getNiceDate()
            self.updateViews()
        }
        
        TasksService.shared.listenToTasks{ newTasks in
            self.tasks = newTasks
            self.updateViews()
        }
        
        view.backgroundColor = .lightGray
        
        view.addSubview(labelStack)
        NSLayoutConstraint.activate([
            labelStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            labelStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            labelStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            labelStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 700)
        ])
        
        view.addSubview(tasksTV)
        NSLayoutConstraint.activate([
            tasksTV.topAnchor.constraint(equalTo: view.topAnchor),
            tasksTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            tasksTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            tasksTV.bottomAnchor.constraint(equalTo: labelStack.topAnchor),
        ])
    }
    
    func checkTaskDone(taskId: String) -> Bool {
        return day?.pStudents.contains(taskId) ?? false
    }
    
    func getPStudentsCount() -> Int {
        return day?.pStudents.count ?? 0
    }
    
    func getAStudentsCount() -> Int {
        let pStudentsCount = getPStudentsCount()
        return tasks.count - pStudentsCount
    }
    
    func updateViews() {
        tasksTV.reloadData()
        pStudentsLabel.text = "✅: \(getPStudentsCount())"
        aStudentsLabel.text = "❎: \(getAStudentsCount())"
    }
}

extension DayAttendanceVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
        
        
        let isTaskDone = checkTaskDone(taskId: task.id)
        if isTaskDone {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        
        DaysService.shared.switchStudentStatus(
            day: day!,
            studentId: task.id
        )
    }
    
    
}
