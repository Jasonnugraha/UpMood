//
//  EditLogViewController.swift
//  UpMood
//
//  Created by Pieter Yonathan on 08/04/21.
//

import UIKit

final class EditLogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationbaredit.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.99, alpha: 1)
    }


    @IBOutlet weak var navigationbaredit: UINavigationBar!
    
    @IBAction func cancelbutton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletedidtapbutton(_ sender: Any) {
        actionsheetdelete()
    }
    
    func deleteHandler(alert: UIActionHandler){
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    func actionsheetdelete(){
            
            let alertController = UIAlertController(title: nil, message: "Delete this log?", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
            present(alertController, animated: true)
            
            alertController.addAction(UIAlertAction(title: "Delete Log", style: .destructive, handler: nil))
        }
}
