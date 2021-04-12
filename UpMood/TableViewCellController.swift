//
//  TableViewCellController.swift
//  UpMood
//
//  Created by Meichel Rendio on 11/04/21.
//

import UIKit

class TableViewCellController: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }



}
