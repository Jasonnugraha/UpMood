//
//  FillDataViewController.swift
//  UpMood
//
//  Created by Meichel Rendio on 09/04/21.
//

import UIKit

class FillDataViewController: UIViewController, UITextFieldDelegate{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var isiTextField: UITextField!
    @IBOutlet weak var feelingTextField: UITextField!
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    @IBOutlet weak var emojiTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func emojiAction(_ sender: Any) {
    }
    @IBAction func isiAction(_ sender: UITextField) {
    }

    @IBAction func feelingAction(_ sender: UITextField) {
    }
    @IBAction func backToMainAndSave(_ sender: Any) {
        //pertama-tama -> slider
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curhat = Curhat(context: self.context)

        
        curhat.feeling = feelingTextField.text
        curhat.date = dateDatePicker.date
        curhat.desc = isiTextField.text
        curhat.emoji = emojiTextField.text
        do {
            try context.save()
        } catch {
        }
        
        dismiss(animated: true, completion:nil )
    }
    

    
}
