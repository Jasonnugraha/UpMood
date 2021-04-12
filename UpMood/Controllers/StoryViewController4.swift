//
//  StoryViewController4.swift
//  UpMood
//
//  Created by Azura on 09/04/21.
//

import UIKit

class StoryViewController4: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.preferredContentSize = CGSize(width: 300, height: 200)
        if let presentationController = segue.destination.popoverPresentationController { // 1
            presentationController.delegate = self // 2
        }
    }
}

extension StoryViewController4: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none // 3
    }
}
