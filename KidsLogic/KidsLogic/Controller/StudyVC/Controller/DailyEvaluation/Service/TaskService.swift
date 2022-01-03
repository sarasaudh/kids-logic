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
    
    let tasksCollection = Firestore.firestore().collection("tasks")
    
    func addTask(task: Tasks) {
//    MARK: -    firestore
        tasksCollection.document(task.id).setData([
            "name": task.name,
            "id": task.id
        ])
        
    }
    
    //delete student
    
    func deletetask(tasktId : String) {
        //firbase
        tasksCollection.document(tasktId).delete()
        
    }
    //    switch student status
    
    //    lessson to students
    
    func listenToTasks(completion: @escaping (([Tasks]) -> Void)) {
        
        //fairbase
        
        tasksCollection.addSnapshotListener { snapshot, error in
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
    func listenToTasktCount(completion: @escaping ((Int) -> Void)) {
        listenToTasks { tasks in
            completion(tasks.count)
        }
    }
    
}
