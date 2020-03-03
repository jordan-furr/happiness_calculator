//
//  EntryTableViewCell.swift
//  NotificationPatternsJournal
//
//  Created by Jordan Furr on 3/3/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

protocol  EntryTableViewCellDelegate: class {
    func tappedCell(for cell: EntryTableViewCell)
}
class EntryTableViewCell: UITableViewCell {
    
    //MARK: - IB OUTLETS & FUNCTIONS
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    @IBOutlet weak var entrySwitch: UISwitch!
    @IBAction func switchTapped(_ sender: Any) {
        delegate?.tappedCell(for: self)
    }
    
    //MARK: - Properties
    var entry: Entry?
    weak var delegate: EntryTableViewCellDelegate?
    
    //MARK: - Helper Functions
    func setEntry(entry: Entry, avgHappy: Int){
        self.entry = entry
        updateUI(avgHappy: avgHappy)
    }
    
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: notificationKey, object: nil)
    }
    
    @objc func updateUI(avgHappy: Int){
        guard let entry = entry else { return }
        titleLabel.text = entry.title
        entrySwitch.isOn = entry.isIncluded
        avgLabel.text = entry.happiness >= avgHappy ? "Higher" : "Lower"
    }
    
}
