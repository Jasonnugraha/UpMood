//
//  StoryViewController3.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class StoryViewController3: UIViewController, UITextViewDelegate, OnboardingParentProtocol{

    var parentPVC: OnboardingPageViewController!
    var notes: String! = ""
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var notesText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 10
        notesText.delegate = self
        notesText.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        notesText.setCorner(radius: 8)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (notesText.textColor == UIColor.darkGray) {
            notesText.text = nil
            notesText.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if notesText.text.isEmpty {
            notesText.text = "Write something down..."
            notesText.textColor = UIColor.darkGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        notes = textView.text
    }
    
    func getParentPageViewController(parentRef: OnboardingPageViewController) {
        parentPVC = parentRef
    }
    
    @IBAction func onNextBtnTap(_ sender: UIButton) {
        parentPVC.setNotes(_sender: self.notesText.text)
        parentPVC.goToNextPage()
    }
    
}

extension UIView {
  func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
