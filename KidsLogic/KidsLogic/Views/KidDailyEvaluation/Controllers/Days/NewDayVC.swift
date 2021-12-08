//
//  NewDayVC.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import UIKit
import FirebaseFirestore


class NewDayVC: UIViewController {

    lazy var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        dp.datePickerMode = .date
        return dp
    }()
    
    lazy var addDayBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemGray
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 30, weight: .ultraLight)
        btn.setTitle("Add day ☑️", for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(addDay), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .quaternaryLabel
        
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        view.addSubview(addDayBtn)
        NSLayoutConstraint.activate([
            addDayBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addDayBtn.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16),
            addDayBtn.heightAnchor.constraint(equalToConstant: 48),
            addDayBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200)
        ])
    }
    
    @objc func dateChanged() {
        
        print("New date = \(datePicker.date)")
    }
    
    @objc func addDay() {
        let date = datePicker.date
        let uuid = UUID().uuidString
        
        DaysService.shared.addDay(
            day: Day(
                id: uuid,
                timestamp: Timestamp(date: date),
                pStudents: []
            )
        )
        
        dismiss(animated: true, completion: nil)
    }
}


