//
//  StoryViewController4.swift
//  UpMood
//
//  Created by Azura on 13/04/21.
//

import UIKit
import Foundation

class StoryViewController4: UIViewController {
    

    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var summaryTableView: UITableView!
    @IBOutlet weak var notesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.layer.cornerRadius = 10
        summaryTableView.delegate = self
        summaryTableView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.preferredContentSize = CGSize(width: 300, height: 200)
        if let presentationController = segue.destination.popoverPresentationController {
            presentationController.delegate = self
        }
    }

}

extension StoryViewController4: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

extension StoryViewController4: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell? =
            tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath)
//        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "summaryCell")
        cell?.textLabel?.text = "Perasaaan iniii"
        cell?.detailTextLabel?.text = "Reasons terlalu banyak shay"
        return cell!
    }
}
