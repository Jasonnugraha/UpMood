//
//  EditModalViewController.swift
//  UpMood
//
//  Created by Pieter Yonathan on 07/04/21.
//

import UIKit

class EditModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func editbuttontapped(_ sender: Any) {
        let viewcontroller = EditLogViewController(nibName: "EditLogViewController", bundle: nil)
        self.present(viewcontroller, animated: true, completion: nil)
    }
}
