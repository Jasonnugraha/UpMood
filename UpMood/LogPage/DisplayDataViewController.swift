//
//  DisplayDataViewController.swift
//  UpMood
//
//  Created by Meichel Rendio on 09/04/21.
//

import UIKit
import CoreData
class DisplayDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableSavedData: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var listCurhat:[Curhat]?
    struct CurhatPerDay {
        var curhatPerDay:[Curhat]
        var dayDate : Date
    }
    
    struct CurhatPerMonth{
        var curhatPerDaylist:[CurhatPerDay]?
        var monthDate : Date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableSavedData.delegate = self
        tableSavedData.dataSource = self
        getCurhatFromCoreData()
        sortTable()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    func sortTable(){
        listCurhat?.sort(by: { ($0.date! > $1.date!)
        })
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        context.delete(listCurhat![indexPath.row])
        do {
            try context.save()
        } catch  {
            
        }
        //load page sebelumnya (tampilin sisa page yang ada)
        tableSavedData.reloadData()
    }
    func getCurhatFromCoreData(){
        do {
            self.listCurhat = try context.fetch(Curhat.fetchRequest())
            DispatchQueue.main.async {
                self.tableSavedData.reloadData()
            }
        } catch  {
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listCurhat!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCellController
        let currentContent = self.listCurhat![indexPath.row]
        cell.dateLabel.text = formatter.string(from: currentContent.date!)
        cell.emojiLabel.text = currentContent.emoji
        cell.feelingLabel.text = currentContent.feeling
        
        return cell
    }
}
