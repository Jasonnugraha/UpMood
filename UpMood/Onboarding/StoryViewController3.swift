//
//  StoryViewController3.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class StoryViewController3: UIViewController, UITextViewDelegate {

    var parentPVC: OnboardingPageViewController!
    var notes: String! = ""
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var notesText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 10
        notesText.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        notes = textView.text
    }
    
    func getParentPageViewController(parentRef: OnboardingPageViewController) {
        parentPVC = parentRef
    }
    
    @IBAction func onNextBtnTap(_ sender: UIButton) {
        print("notes type", type(of: notes))
        print("notes", notes)
        print("notes!", notes!)
        let temp = notes! as String
        parentPVC.setNotes(_sender: temp)
        
    }
    
}
