//
//  ViewController.swift
//  UpMood
//
//  Created by Jason Nugraha on 05/04/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var emotionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        emotionTableView.delegate = self
        emotionTableView.dataSource = self
    }
    
    var dataSeed: [Emotion] = [Emotion(isChecked: false, emoji: "👨‍👨‍👧‍👦", emotion: "Family"),
                               Emotion(isChecked: true, emoji: "📚", emotion: "Study")]
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row > 3 {
        let customCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let data = dataSeed[indexPath.row]
        customCell.editCustomCellText(from: data.emoji, from: data.emotion, status: data.isEditable)
        return customCell
//        }
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "emotionCell", for: indexPath)
//        cell.textLabel?.text = "jason"
//        let emotionSwitch = UISwitch()
//        emotionSwitch.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
//        cell.editingAccessoryType = UITableViewCell.AccessoryType.checkmark
//        cell.accessoryView = emotionSwitch
        
//        return cell
    }
    
    

    
    
    @objc func didChangeSwitch(_ sender: UISwitch){
        if sender.isOn {
            print("ON")
        } else {
            print("OFF ")
        }
    }
}

