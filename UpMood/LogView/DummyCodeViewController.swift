//
//  DummyCodeViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 09/04/21.
//

import UIKit

class DummyCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goButtonEx(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goButton", sender: DummyCodeViewController.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //validasi
        if segue.identifier == "goButton"{
/*
            let destinationVc = segue.destination as! NewLogPageViewController
            destinationVc.numberOfPages = 3
 */
            let destinationVc = segue.destination as! LogPageViewController
            destinationVc.x = 3
            
        }
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
