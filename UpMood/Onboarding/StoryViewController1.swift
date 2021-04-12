//
//  StoryViewController1.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class StoryViewController1: UIViewController, PageObservation {
    
    var parentPVC: OnboardingPageViewController!
    
    func getParentPageViewController(parentRef: OnboardingPageViewController) {
        parentPVC = parentRef
    }
    
    @IBAction func onNextBtnTap(_ sender: UIButton) {
        parentPVC.setDataSourceSelf()
    }

}
