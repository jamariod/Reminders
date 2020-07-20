//
//  NewReminderViewController.swift
//  Reminders
//
//  Created by Jamario Davis on 7/19/20.
//  Copyright © 2020 Jamario Davis. All rights reserved.
//

import UIKit

class NewReminderViewController: UIViewController {
    var reminderIndex: Int?
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let reminderIndex = reminderIndex{
            let reminder = ReminderService.shared.getReminder(index: reminderIndex)
            titleTextField.text = reminder.title
            datePicker.date = reminder.date
            completedSwitch.isOn = reminder.isCompleted
        }
    }
    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
          let reminder = Reminder(title: titleTextField.text!, date: datePicker.date, isCompleted: completedSwitch.isOn)
        // Update a reminder
        if let reminderIndex = reminderIndex{
            ReminderService.shared.update(reminder: reminder, index: reminderIndex)
            // Else, create a new reminder object
        } else {
              ReminderService.shared.create(reminder: reminder)
        }
        // Create a reminder object
        navigationController!.popViewController(animated: true)
    }
}
