//
//  EntryTableViewCell.swift
//  NotificationPatternsJournal
//
//  Created by Jordan Furr on 3/3/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    //MARK: - IB OUTLETS & FUNCTIONS
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    @IBOutlet weak var entrySwitch: UISwitch!
    
    //MARK: - Properties
    var entry: Entry?
    
    
    //MARK: - Helper Functions
    func setEntry(entry: Entry, avgHappy: Int){
        self.entry = entry
    }
    
    func updateUI(avgHappy: Int){
        guard let entry = entry else { return }
        titleLabel.text = entry.title
        entrySwitch.isOn = entry.isIncluded
    }
    
}
