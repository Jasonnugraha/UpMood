//
//  CustomTableViewCell.swift
//  UpMood
//
//  Created by Jason Nugraha on 07/04/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customCheckListButton: UIButton!
    @IBOutlet weak var customEmojiTextField: UITextField!
    @IBOutlet weak var customEmotionTextField: UITextField!
    
    static let identifier = "CustomTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func editCustomCellText(from emoji: String, emotionText: String){
        customEmotionTextField.text = emotionText
        customEmojiTextField.text = emoji
    }
}
