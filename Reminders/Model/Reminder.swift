//
//  Reminder.swift
//  Reminders
//
//  Created by Jamario Davis on 7/19/20.
//  Copyright © 2020 Jamario Davis. All rights reserved.
//

import Foundation

class Reminder: Codable{
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(title: String, date: Date, isCompleted: Bool) {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}
