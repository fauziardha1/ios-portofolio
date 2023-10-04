//
//  Reminders.swift
//  LackTraining
//
//  Created by User on 26/09/23.
//

import Foundation

struct Reminder {
    let title: String
    let dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
    
    init(title: String, dueDate: Date, notes: String? = nil, isComplete: Bool) {
        self.title = title
        self.dueDate = dueDate
        self.notes = notes
        self.isComplete = isComplete
    }
}

#if DEBUG
extension Reminder {
    static var sampleData = [
        Reminder(title: "Title1", dueDate: Date().addingTimeInterval(100), notes: "notes1", isComplete: false),
        Reminder(title: "Title2", dueDate: Date().addingTimeInterval(2000000), notes: "notes2", isComplete: false),
        Reminder(title: "Title3", dueDate: Date().addingTimeInterval(300000000), notes: "notes3", isComplete: true),
        Reminder(title: "Title4", dueDate: Date().addingTimeInterval(400000000), notes: "notes4", isComplete: false),
        Reminder(title: "Title5", dueDate: Date().addingTimeInterval(500000000), notes: "notes5", isComplete: true),
        Reminder(title: "Title6", dueDate: Date().addingTimeInterval(600000000), notes: "notes6", isComplete: false),
    ]
}
#endif
