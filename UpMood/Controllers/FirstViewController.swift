//
//  FirstViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 06/04/21.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var feelingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        feelingsLabel.text = "Angry"
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
