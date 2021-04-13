//
//  ViewController.swift
//  page control
//
//  Created by theodore teofillius on 06/04/21.
//

import UIKit
import Foundation

class TableViewController: UIViewController {
    
    var dataSeed: [Labels] = [Labels(isChecked: false, emojiLogo: "👨‍👨‍👧‍👦", reason: "Family"),
                               Labels(isChecked: true, emojiLogo: "📚", reason: "Study")]
    
    
    @IBOutlet weak var emotionTableView: UITableView!


    @IBAction func buttonIsPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToLogsStoryboard", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionTableView.register(ReusableReasonCell.nib(), forCellReuseIdentifier: ReusableReasonCell.identifier)
        emotionTableView.delegate = self
        emotionTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLogsStoryboard"{
            guard let vc = segue.destination as? Logs else{return}
        }
    }
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
