//
//  StoryViewController3.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class StoryViewController3: UIViewController, UITextViewDelegate {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var notesText: UITextView!
    var notes: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 10
        notesText.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        notes = textView.text
    }

}
