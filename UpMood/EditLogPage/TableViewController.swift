//
//  ViewController.swift
//  page control
//
//  Created by theodore teofillius on 06/04/21.
//

import UIKit
import Foundation

class TableViewController: UIViewController {
    
    var dataSeed: [Labels] = [Labels(isChecked: false, emojiLogo: "👨‍👨‍👧‍👦", reason: "Family", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "👯‍♀️", reason: "Friend", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "⛅️", reason: "Weather", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "📝", reason: "School", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "💓", reason: "Relationship", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "👤", reason: "Self", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "💼", reason: "Work", isEditable: false)]
    
    
    @IBOutlet weak var emotionTableView: UITableView!
    @IBAction func deletedidtapbutton(_ sender: Any) {
        actionsheetdelete()
    }
    @IBAction func cancelbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

/*    @IBAction func buttonIsPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToLogsStoryboard", sender: self)
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionTableView.register(ReusableReasonCell.nib(), forCellReuseIdentifier: ReusableReasonCell.identifier)
        emotionTableView.delegate = self
        emotionTableView.dataSource = self
    }
    
// Action Sheet
    func deleteHandler(alert: UIActionHandler){
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    func actionsheetdelete(){
            
            let alertController = UIAlertController(title: nil, message: "Delete this log?", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
            present(alertController, animated: true)
            
            alertController.addAction(UIAlertAction(title: "Delete Log", style: .destructive, handler: nil))
        }
    
/*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLogsStoryboard"{
            guard let vc = segue.destination as? Logs else{return}
        }
    } */
}

// Emotion Controller

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: ReusableReasonCell.identifier, for: indexPath) as! ReusableReasonCell
        let data = dataSeed[indexPath.row]
        customCell.editReasonCell(from: data.emojiLogo, from: data.reason, status: data.isEditable)
        
        return customCell

    }
    
}
