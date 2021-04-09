//
//  ViewController.swift
//  page control
//
//  Created by theodore teofillius on 06/04/21.
//

import UIKit
import Foundation

class TableViewController: UIViewController {
    
    var dataSeed: [Emotion] = [Emotion(isChecked: false, emoji: "👨‍👨‍👧‍👦", emotion: "Family"),
                               Emotion(isChecked: true, emoji: "📚", emotion: "Study")]
    
    @IBOutlet weak var emotionTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        emotionTableView.delegate = self
        emotionTableView.dataSource = self
    }
}

// Emotion Controller

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let data = dataSeed[indexPath.row]
        customCell.editCustomCellText(from: data.emoji, from: data.emotion, status: data.isEditable)
        
        return customCell

    }
    
}
