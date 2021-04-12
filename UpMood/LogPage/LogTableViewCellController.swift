//
//  LogTableViewCellController.swift
//  UpMood
//
//  Created by Jason Nugraha on 11/04/21.
//

import UIKit

class LogTableViewCellController: UIViewController {
    
    
    var logDataSeed: [Logs] = [Logs(emotion: Emotion(isChecked: false, emojiLogo: "👨‍👨‍👧‍👦", reason: "Family",currentEmotion:"Sad"), dateStamp: Date())]

    @IBOutlet weak var logsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logsTableView.register(ReusableLogsCell.nib(), forCellReuseIdentifier: ReusableLogsCell.identifier)
        logsTableView.delegate = self
        logsTableView.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension LogTableViewCellController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logDataSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let logCell = tableView.dequeueReusableCell(withIdentifier: ReusableLogsCell.identifier, for: indexPath) as! ReusableLogsCell
        let data = logDataSeed[indexPath.row]
        logCell.editLogsCell(from: data)
        return logCell
    }
    
    
}
