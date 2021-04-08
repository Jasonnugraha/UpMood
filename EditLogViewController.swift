//
//  EditLogViewController.swift
//  UpMood
//
//  Created by Pieter Yonathan on 08/04/21.
//

import UIKit

class EditLogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationbaredit.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.99, alpha: 1)
    }

    @IBOutlet weak var navigationbaredit: UINavigationBar!
    
    @IBAction func cancelbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
