//
//  ReminderService.swift
//  Reminders
//
//  Created by Jamario Davis on 7/19/20.
//  Copyright © 2020 Jamario Davis. All rights reserved.
//

import Foundation


class ReminderService{
    static let shared = ReminderService()
    private var reminders = [Reminder]()
    private var url: URL
    private init(){
        url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        url.appendPathComponent("reminder.json")
        print(url)
        load()
    }
    func load(){
        do{
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
            reminders = try decoder.decode([Reminder].self, from: data)
        } catch {
             print("error loading file \(error.localizedDescription)")
        }
    }
    func save(){
        do{
        let encoder = JSONEncoder()
        let data = try encoder.encode(reminders)
        try data.write(to: url)
        } catch {
            print("error saving file \(error.localizedDescription)")
        }
    }
    // Create
    func create(reminder: Reminder){
       // Add reminder to reminders array in a sorted order
        var indexToInsert: Int?
        for (index, element) in reminders.enumerated(){
            if element.date.timeIntervalSince1970 > reminder.date.timeIntervalSince1970{
                indexToInsert = index
                break
            }
        }
        // If we have indexToInsert, then we use it!
        if let indexToInsert = indexToInsert{
            reminders.insert(reminder, at: indexToInsert)
        // If not, then we would appened the reminder to the end of our array
        } else {
              reminders.append(reminder)
        }
       save()
    }
    // Update
    func update(reminder: Reminder, index: Int){
        reminders[index] = reminder
        save()
    }
    // Get # of reminders
    func getCount() -> Int{
        return reminders.count
    }
    // Get a specific reminder
    func getReminder(index: Int) -> Reminder{
        return reminders[index]
    }
    // Toggle completed  status of a reminder
    func toggleCompleted(index: Int){
        let reminder = getReminder(index: index)
        reminder.isCompleted = !reminder.isCompleted
        save()
    }
    // Get the list of reminders
    func getReminders() -> [Reminder]{
        return reminders
    }
    // Delete a reminder
    func delete(index: Int){
        reminders.remove(at: index)
        save() 
    }
    // Get the favorite reminder
    func getFavoritedReminder() -> Reminder?{
        return reminders.first
    }
}
































































