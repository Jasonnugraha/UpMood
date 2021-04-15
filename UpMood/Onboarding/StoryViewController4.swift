//
//  StoryViewController4.swift
//  UpMood
//
//  Created by Azura on 13/04/21.
//

import UIKit
import Foundation

class StoryViewController4: UIViewController, OnboardingParentProtocol {
    

    var parentPVC: OnboardingPageViewController!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var summaryTableView: UITableView!
    @IBOutlet weak var notesLabel: UITextView!
    var emotion: String! = "Today you feel"
    var notes: String! = "Huhuhu"
    var reasons: Array<String>! = []
    var allReasons: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromParent()
        print("after get data from parent")
        summaryTableView.reloadData()
        submitBtn.layer.cornerRadius = 10
        summaryTableView.delegate = self
        summaryTableView.dataSource = self
        notesLabel.text = parentPVC.notes
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        parentPVC.saveCurhat()
        segue.destination.preferredContentSize = CGSize(width: 300, height: 200)
        if let presentationController = segue.destination.popoverPresentationController {
            presentationController.delegate = self
        }
    }
    
    // Child Implements Parent's Protocol
    func getParentPageViewController(parentRef: OnboardingPageViewController) {
        parentPVC = parentRef
    }
    
    func getDataFromParent() {
        emotion = parentPVC.emotionDescription
        reasons = parentPVC.causeOfFeelingDescArray
        for i in 0..<reasons.count {
            if (i == 0) {
                allReasons += reasons[i]
            } else if (i > 0 && i < reasons.count) {
                allReasons += ", \(reasons[i])"
            }
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
        cell?.textLabel?.text = "Today you feel "+emotion
        cell?.detailTextLabel?.text = allReasons!
        return cell!
    }
}
