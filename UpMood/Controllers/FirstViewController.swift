//
//  FirstViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 09/04/21.
//

import UIKit

class FirstViewController: UIViewController {


    @IBOutlet weak var topBar: UIImageView!
    @IBOutlet weak var navItemTop: UINavigationBar!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        topBar.backgroundColor = .systemPurple
        navItemTop.backgroundColor = .blue
        
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
