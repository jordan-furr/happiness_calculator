//
//  EntryListTableViewController.swift
//  NotificationPatternsJournal
//
//  Created by Jordan Furr on 3/3/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

 let notificationKey = Notification.Name(rawValue: "didChangeHappiness")

class EntryListTableViewController: UITableViewController {

    var avgHappy = 0 {
        didSet {
            NotificationCenter.default.post(name: notificationKey, object: self.avgHappy)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as? EntryTableViewCell else { return UITableViewCell()}
        
        let entry = EntryController.entries[indexPath.row]
        cell.setEntry(entry: entry, avgHappy: avgHappy)
        cell.delegate = self
        return cell
    }
    
    func updateHappy() {
        var totalHappy = 0
        for entry in EntryController.entries {
            if entry.isIncluded {
                totalHappy += entry.happiness
            }
        }
        avgHappy = totalHappy / EntryController.entries.count
    }
}
extension EntryListTableViewController: EntryTableViewCellDelegate {
    func tappedCell(for cell: EntryTableViewCell) {
        guard let entry = cell.entry else {return}
        EntryController.updateEntry(entry: entry)
        updateHappy()
        cell.updateUI(avgHappy: avgHappy)
    }
}
