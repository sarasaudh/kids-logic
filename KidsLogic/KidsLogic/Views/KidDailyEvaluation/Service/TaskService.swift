//
//  TaskService.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import Foundation

import UIKit
import FirebaseFirestore

class TasksService {
    
    //add student
    static let shared = TasksService()
    
    let studentsCollection = Firestore.firestore().collection("students")
    
    func addStudent(student: Tasks) {
        //firestore
        studentsCollection.document(student.id).setData([
            "name": student.name,
            "id": student.id
        ])
   
    }
    
    //delete student
    
    func deleteStudent(studentId : String) {
        //firbase
        studentsCollection.document(studentId).delete()

    }
//    switch student status
    
//    lessson to students
    
    func listenToStudents(completion: @escaping (([Tasks]) -> Void)) {
        
        //fairbase
        
        studentsCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            var tasks: Array<Tasks> = []
            for document in documents {
                let data = document.data()
                let task = Tasks(
                    name: (data["name"] as? String) ?? "No name",
                    id: (data["id"] as? String) ?? "No id"
                )
                tasks.append(task)
            }
            
            completion(tasks)
        }
    }
    
//    get students cunt
    func listenToStudentCount(completion: @escaping ((Int) -> Void)) {
        listenToStudents { students in
            completion(students.count)
        }
    }
    
}
