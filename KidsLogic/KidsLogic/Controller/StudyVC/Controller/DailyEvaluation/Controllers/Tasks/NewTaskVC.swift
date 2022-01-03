//
//  NewTaskVc.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import UIKit

class NewTaskVC: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - properties
    lazy var taskNameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = " Write New Task ✍🏻 Enter ↳"
        tf.backgroundColor = .systemGray5
        tf.delegate = self
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ADD NEW NAME 🙋"
        view.backgroundColor = .quaternaryLabel
        
        view.addSubview(taskNameTF)
        NSLayoutConstraint.activate([
            taskNameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskNameTF.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            taskNameTF.heightAnchor.constraint(equalToConstant: 48),
            taskNameTF.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = taskNameTF.text ?? ""
        let uuid = UUID().uuidString
        
        TasksService.shared.addTask(
            task: Tasks(name: name, id: uuid)
        )
        
        dismiss(animated: true, completion: nil)
        return true
    }
    
}
