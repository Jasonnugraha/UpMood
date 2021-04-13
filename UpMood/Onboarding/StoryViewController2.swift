//
//  StoryViewController2.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit
import Foundation

protocol StoryViewController2Delegate {
    func reasonDidSelected(indexPath: IndexPath?)
}

@IBDesignable
class StoryViewController2: UIViewController, PageObservation {
    
    var parentPVC: OnboardingPageViewController!
    var dataSeed: [Labels] = [Labels(isChecked: false, emojiLogo: "👨‍👨‍👧‍👦", reason: "Family"),
                               Labels(isChecked: true, emojiLogo: "📚", reason: "Study")]
    
    
    @IBOutlet weak var emotionTableView: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    
    var index: Int!
    
    func getParentPageViewController(parentRef: OnboardingPageViewController) {
        parentPVC = parentRef
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SVC2 Loaded")
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
        customCell.indexPath = indexPath
        customCell.delegate = self
//        customCell.customCheckListButton.tag = indexPath.row
//        customCell.customCheckListButton.addTarget(self, action: #selector(buttonTap(sender:)), for: .touchUpInside)
        return customCell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? ReusableReasonCell else { return }
        cell.isChecked = true
    }
    
    @objc func buttonTap(sender: UIButton) {
        print("tapped")
        print("sender tag", sender.tag)
    }
    
}

extension StoryViewController2: StoryViewController2Delegate {
    func reasonDidSelected(indexPath: IndexPath?) {
        print("\(dataSeed[indexPath?.row ?? 0])")
    }
    
    
}
