//
//  RemindersViewController.swift
//  Reminders
//
//  Created by Jamario Davis on 7/19/20.
//  Copyright © 2020 Jamario Davis. All rights reserved.
//

import UIKit

class RemindersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ReminderService.shared.toggleCompleted(index: indexPath.row)
        tableView.reloadData()
    }
    @IBAction func editButtonDidPressed(_ sender: UIBarButtonItem) {
        if tableView.isEditing{
            tableView.isEditing = false
            sender.title = "Edit"
        } else {
            tableView.isEditing = true
            sender.title = "Done"
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       // If user wants to delete a cell
        if editingStyle == .delete{
            ReminderService.shared.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderService.shared.getCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // Dequeue the call from reuse pool
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell") as! ReminderCell
        // Get the reminder for the given index path
        let reminder = ReminderService.shared.getReminder(index: indexPath.row)
        // Update the call base on the reminder object
        cell.update(reminder: reminder, index: indexPath.row)
        // Return cell
        return cell 
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateSegue", let newReminderViewController = segue.destination as? NewReminderViewController, let infoButton = sender as? UIButton{
            newReminderViewController.reminderIndex = infoButton.tag
        }
    }
}

















































































