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
        let alertController = UIAlertController(title: nil, message: "Delete this log?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Delete Log", style: .destructive, handler: self.deleteHandler(alert:) ))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteHandler(alert: UIAlertAction!){
     self.deleteContent()
      self.performSegue(withIdentifier: "backtomainpage", sender: self)
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
        print("\(curhat?.date) \(curhat?.feeling!)")
        
        
        
        // ini ambil data
        fetchAndUpdateTheContent()
//        self.reloadInputViews()
    }
    
    func fetchAndUpdateTheContent(){
        self.editDatePicker.date = (curhat?.date)!
        
        if curhat!.feeling! == "Calm" {
            self.reusableSlider.horizontalSlider.value = 0
            print("Calm")
                }
        else if curhat!.feeling! == "Comfortable" {
            self.reusableSlider.horizontalSlider.value = 1
            print("Comfortable")
        }
        else if curhat!.feeling! == "Okay" {
            self.reusableSlider.horizontalSlider.value = 2
            
            print("Okay")
        }
       else if curhat!.feeling! == "Annoyed" {
            self.reusableSlider.horizontalSlider.value = 3
            print("Annoyed")
        }
      else if curhat!.feeling! == "Nervous" {
            self.reusableSlider.horizontalSlider.value = 4
            print("Nervous")
        }
      else if curhat!.feeling! == "Anxious" {
            self.reusableSlider.horizontalSlider.value = 5
            print("Anxious")
        }
       else if curhat!.feeling! == "Worried" {
            self.reusableSlider.horizontalSlider.value = 6
            print("Worried")
        }
        else if curhat!.feeling! == "Fearful" {
            self.reusableSlider.horizontalSlider.value = 7
            print("Fearful")
        }
        else if curhat!.feeling! == "Panicked"{
            self.reusableSlider.horizontalSlider.value = 8
            print("Panicked")
        }
        
        // emot
        reusableSlider.emoticon.text = reusableSlider.emot[Int(reusableSlider.horizontalSlider.value)]
        
        // infoemot
        reusableSlider.infoemot.text = reusableSlider.labelemo[Int(reusableSlider.horizontalSlider.value)]
        
        // gradien back emo
        reusableSlider.grtbackemo.image = reusableSlider.gradbackemo[Int(reusableSlider.horizontalSlider.value)]
    }
    
    func deleteContent(){
        context.delete(curhat!)
        do {
            try context.save()
        } catch {
            
        }
    }
    
// Action Sheet
    
    
    
  //  func actionsheetdelete(){
         
        /*  let cancelbutton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                self.navigationController?.pushViewController(UIViewController(), animated: true)
            }
                present(alertController, animated: true)
                
        let deletebutton = UIAlertAction(title: "Delete Log", style: .destructive){ (action) in
                //self.navigationController?.pushViewController(UIViewController(), animated: true)
                self.deleteContent()
                self.dismiss(animated: true,completion: nil)
                self.deleteHandler(alert: nil)
                
            }
            alertController.addAction(cancelbutton)
    
        alertController.addAction(UIAlertAction(title: "Delete Log", style: .destructive, handler: self.deleteHandler))
            //alertController.addAction(deletebutton)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Delete Log", style: .destructive, handler: self.deleteHandler))
    }*/
    
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
