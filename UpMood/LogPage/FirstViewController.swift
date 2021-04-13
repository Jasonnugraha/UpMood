//
//  FirstViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 09/04/21.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textViewArea: UITextView!
    @IBOutlet weak var backEmo: UIImageView!
    @IBOutlet weak var feelingsToday: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var summary: [Curhat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewArea.delegate = self
        
        backgroundEmot()
        feelingsToday.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        textViewArea.layer.cornerRadius = 10
        //let uuid = UUID().uuidString
        //print(uuid)
        
        //getCurhatFromCoreData()
      
    }
    func backgroundEmot(){
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x:0, y:0, width: 73, height: 73)
        gradient.colors = [
            UIColor(red: 0.43, green: 0.7, blue: 0.93, alpha: 1).cgColor,
            UIColor(red: 0.25, green: 0.61, blue: 0.91, alpha: 1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 0.95)
        gradient.cornerRadius = 35
        backEmo.layer.addSublayer(gradient)
        backEmo.layer.cornerRadius = 35
        backEmo.layer.insertSublayer(gradient, at: 0)
    }

/*
    func getCurhatFromCoreData(){
        do {
            try context.fetch(Curhat.fetchRequest())
            self.textViewArea.reloadInputViews()
/*            DispatchQueue.main.async {
                self.tableSavedData.reloadData()
            }
*/
        } catch  {
            print("error")
        }
    }
    
*/
    /*
            // MARK: - Navigation

            // In a storyboard-based application, you will often want to do a little preparation before navigation
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                // Get the new view controller using segue.destination.
                // Pass the selected object to the new view controller.
    */
    
    
    

}
