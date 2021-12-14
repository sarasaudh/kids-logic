//
//  Day.swift
//  KidsLogic
//
//  Created by sara saud on 04/05/1443 AH.
//

import Foundation

import FirebaseFirestore

struct Day {
    let id: String
    let timestamp: Timestamp
    var pTasks: Array<String>
    
    func getNiceDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: timestamp.dateValue())
    }
}
