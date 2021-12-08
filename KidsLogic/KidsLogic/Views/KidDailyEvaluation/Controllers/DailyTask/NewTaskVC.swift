//
//  NewTaskVc.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import UIKit

class NewTaskVC: UIViewController, UITextFieldDelegate {
    
    lazy var studentNameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = " Write New Task ✍🏻 "
        tf.backgroundColor = .systemGray5
        tf.delegate = self
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ADD NEW NAME 🙋"
        view.backgroundColor = .quaternaryLabel
        
        view.addSubview(studentNameTF)
        NSLayoutConstraint.activate([
            studentNameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentNameTF.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            studentNameTF.heightAnchor.constraint(equalToConstant: 48),
            studentNameTF.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = studentNameTF.text ?? ""
        let uuid = UUID().uuidString

        TasksService.shared.addStudent(
            student: Tasks(name: name, id: uuid)
        )
        
        dismiss(animated: true, completion: nil)
        return true
    }
    
}
