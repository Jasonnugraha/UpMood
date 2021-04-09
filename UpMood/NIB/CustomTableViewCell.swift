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
    @IBOutlet weak var customReasonTextField: UITextField!
    
    
    @IBAction func checklistPressed(_ sender: UIButton) {
        customCheckListButton.isSelected.toggle()
    }
    
    static let identifier = "CustomTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customReasonTextField.backgroundColor = UIColor.clear

        customReasonTextField.layer.borderColor = UIColor.clear.cgColor
        
        customEmojiTextField.backgroundColor = UIColor.clear
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func editCustomCellText(from emoji: String, from emotionText: String, status isEditable: Bool){
        customReasonTextField.text = emotionText
        customEmojiTextField.text = emoji
        customReasonTextField.isUserInteractionEnabled = isEditable
        customEmojiTextField.isUserInteractionEnabled = isEditable
        customEmojiTextField.borderStyle = .none
        customReasonTextField.borderStyle = .none
    }
    
    
}
