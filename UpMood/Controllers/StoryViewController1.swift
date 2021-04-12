//
//  StoryViewController1.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class StoryViewController1: UIViewController {
    var parentPVC: UIPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        parentPVC = self.parent as? UIPageViewController
    }
    
    @IBAction func onNextBtnTap(_ sender: UIButton) {
        parentPVC.dataSource = parentPVC.self as? UIPageViewControllerDataSource
        parentPVC.delegate = parentPVC.self as? UIPageViewControllerDelegate
    }
    
}
