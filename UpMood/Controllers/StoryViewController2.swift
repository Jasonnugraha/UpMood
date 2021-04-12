//
//  StoryViewController2.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class StoryViewController2: UIViewController, PageObservation {
    
    var parentPVC: OnboardingPageViewController!
    
    func getParentPageViewController(parentRef: OnboardingPageViewController) {
        parentPVC = parentRef
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SVC2 is Loaded")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
