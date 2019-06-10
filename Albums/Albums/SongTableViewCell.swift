//
//  SongTableViewCell.swift
//  Albums
//
//  Created by Mitchell Budge on 6/10/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Methods
    
    @IBAction func addSongButtonPressed(_ sender: Any) {
        
    }
    
    // MARK: - Properties & Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var addSongButton: UIButton!
    
}
