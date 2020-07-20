//
//  FavoriteReminderViewController.swift
//  Reminders
//
//  Created by Jamario Davis on 7/19/20.
//  Copyright © 2020 Jamario Davis. All rights reserved.
//

import UIKit

class FavoriteReminderViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let favoritedReminder = ReminderService.shared.getFavoritedReminder(){
            titleLabel.text = favoritedReminder.title
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy hh:mma"
            dateLabel.text = dateFormatter.string(from: favoritedReminder.date)
        }
    }
}
