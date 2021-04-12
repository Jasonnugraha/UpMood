//
//  ReusableLogsCell.swift
//  UpMood
//
//  Created by Jason Nugraha on 11/04/21.
//

import UIKit

class ReusableLogsCell: UITableViewCell {
    @IBOutlet weak var emojiLogsTextField: UITextField!
    @IBOutlet weak var dateLogsLabel: UILabel!
    @IBOutlet weak var emotionLogsLabel: UILabel!
    
    static let identifier = "ReusableLogsCell"
    
    static func nib()->UINib{
        return UINib(nibName: "ReusableLogsCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func editLogsCell(from logs:Logs){
        emojiLogsTextField.text = logs.emotion.emojiLogo
        emotionLogsLabel.text = logs.emotion.currentEmotion
        let date = logs.dateStamp
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        dateLogsLabel.text = dateFormatter.string(from: date)
        
        //styling
        emojiLogsTextField.borderStyle = .none
    }
    
}
