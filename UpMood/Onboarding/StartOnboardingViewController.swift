//
//  StartOnboardingViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class StartOnboardingViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 10
    }
    

    @IBAction func actionNextButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToPageViewControler", sender: StartOnboardingViewController.self)
    }

}
