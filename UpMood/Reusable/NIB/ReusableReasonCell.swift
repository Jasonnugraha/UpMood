//
//  CustomTableViewCell.swift
//  UpMood
//
//  Created by Jason Nugraha on 07/04/21.
//

import UIKit

class ReusableReasonCell: UITableViewCell {
    
    @IBOutlet weak var customCheckListButton: UIButton!
    @IBOutlet weak var customEmojiTextField: UITextField!
    @IBOutlet weak var customReasonTextField: UITextField!
    var isChecked: Bool! = false
    
    //perdelegatean
    var delegate: StoryViewController2Delegate?
    var delegateTableView : TableViewControllerDelegate?
    var indexPath: IndexPath?
    
    @IBAction func checklistPressed(_ sender: UIButton) {
        customCheckListButton.isSelected.toggle()
        isChecked = customCheckListButton.isSelected
        delegate?.reasonDidSelected(indexPath: indexPath)
    }
    
    static let identifier = "ReusableReasonCell"
    
    static func nib()->UINib{
        return UINib(nibName: "ReusableReasonCell", bundle: nil)
    }
    
    func checkRadioButton(){
        if isChecked{
            customCheckListButton.isSelected = isChecked
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkRadioButton()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func editReasonCell(from label:Labels){
        customReasonTextField.text = label.reason
        customEmojiTextField.text = label.emojiLogo
        customReasonTextField.isUserInteractionEnabled = label.isEditable
        customEmojiTextField.isUserInteractionEnabled = label.isEditable
        customCheckListButton.isHidden = !label.isEditable
        customEmojiTextField.borderStyle = .none
        customCheckListButton.isSelected = label.isChecked
        isChecked = label.isChecked
        customReasonTextField.borderStyle = .none
    }
    
    
}
