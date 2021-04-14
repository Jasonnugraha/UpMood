//
//  StoryViewController1.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class StoryViewController1: UIViewController, PageObservation {
    
    var parentPVC: OnboardingPageViewController!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var emotionSlider: ReusableSlider!
    var slider: UISlider!
    var emotionValue: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 10
        slider = emotionSlider.horizontalSlider
        slider.addTarget(self, action: #selector(sliderValueDidChange(sender:)), for: .valueChanged)
        print("slider value", slider.value)
    }
    
    @objc func sliderValueDidChange(sender: UISlider) {
//        print("sender value", sender.value)
        emotionValue = Int(sender.value)
    }
    
    func getParentPageViewController(parentRef: OnboardingPageViewController) {
        parentPVC = parentRef
       
    }
    
    @IBAction func onNextBtnTap(_sender: UIButton) {
        parentPVC.setFeeling(_sender: emotionValue)
    }
    
}
