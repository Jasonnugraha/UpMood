//
//  ViewController.swift
//  page control
//
//  Created by theodore teofillius on 06/04/21.
//

import UIKit
import Foundation

protocol TableViewControllerDelegate {
    func sliderValueChanged(sliderValue: Int, infoEmot:String?)
    func reloadTable()
}

class TableViewController: UIViewController {
    
    var dataSeed: [Labels] = [Labels(isChecked: false, emojiLogo: "👨‍👨‍👧‍👦", reason: "Family", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "👯‍♀️", reason: "Friend", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "⛅️", reason: "Weather", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "📝", reason: "School", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "💓", reason: "Relationship", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "👤", reason: "Self", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "💼", reason: "Work", isEditable: false)]
    
    // core data variable preparation
    var curhat : Curhat?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    @IBOutlet weak var editDatePicker: UIDatePicker!
    @IBOutlet weak var reusableSlider: ReusableSlider!
    
    
    @IBOutlet weak var emotionTableView: UITableView!
    @IBAction func deletedidtapbutton(_ sender: Any) {
        actionsheetdelete()
    }
    @IBAction func cancelbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionTableView.register(ReusableReasonCell.nib(), forCellReuseIdentifier: ReusableReasonCell.identifier)
        emotionTableView.delegate = self
        emotionTableView.dataSource = self
        reusableSlider.delegate = self
        print("hello")
//        print(type(of: curhat?.causeOfFeelingDesc))
//        getTodayCurhat()
        print("\(curhat?.date) \(curhat?.feeling)")
        
        // ini ambil data
        fetchAndUpdateTheContent()
//        self.reloadInputViews()
    }
    
    

    
    func fetchAndUpdateTheContent(){
        self.editDatePicker.date = (curhat?.date)!
        
        
        
    }
    
    func deleteContent(){
        context.delete(curhat!)
        do {
            try context.save()
        } catch {
            
        }
    }
    
// Action Sheet
    func deleteHandler(alert: UIActionHandler){
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    
    
    func actionsheetdelete(){
            let alertController = UIAlertController(title: nil, message: "Delete this log?", preferredStyle: .actionSheet)
            let cancelbutton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                self.navigationController?.pushViewController(UIViewController(), animated: true)
            }
                present(alertController, animated: true)
                
            let deletebutton = UIAlertAction(title: "Delete Log", style: .destructive){ (action) in
                //self.navigationController?.pushViewController(UIViewController(), animated: true)
                self.deleteContent()
                self.dismiss(animated: true,completion: nil)
                
            }
            alertController.addAction(cancelbutton)
            alertController.addAction(deletebutton)
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

extension TableViewController:TableViewControllerDelegate{
    func sliderValueChanged(sliderValue: Int, infoEmot: String?) {
        print("\(sliderValue)  dan \(infoEmot)")
    }
    
    func reloadTable() {
        //
    }
    
    
    
    
}
