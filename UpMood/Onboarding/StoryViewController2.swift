//
//  StoryViewController2.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit
import Foundation

class StoryViewController2: UIViewController, PageObservation {
    
    var parentPVC: OnboardingPageViewController!
    var dataSeed: [Labels] = [Labels(isChecked: false, emojiLogo: "👨‍👨‍👧‍👦", reason: "Family"),
                               Labels(isChecked: true, emojiLogo: "📚", reason: "Study")]
    
    
    @IBOutlet weak var emotionTableView: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    
    func getParentPageViewController(parentRef: OnboardingPageViewController) {
        parentPVC = parentRef
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 10
        emotionTableView.register(ReusableReasonCell.nib(), forCellReuseIdentifier: ReusableReasonCell.identifier)
        emotionTableView.delegate = self
        emotionTableView.dataSource = self
    }

}

// Emotion Controller
extension StoryViewController2: UITableViewDelegate, UITableViewDataSource {
    
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
