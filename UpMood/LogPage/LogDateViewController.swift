//
//  LogDateViewController.swift
//  UpMood
//
//  Created by Meichel Rendio on 13/04/21.
//

import UIKit
import CoreData
class LogDateViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    
    var curhat : Curhat?
    var listCurhat : [Curhat]?
    var listTodayCurhat : [Curhat]? = []
    @IBOutlet weak var tableDisplayDate: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDisplayDate.delegate = self
        tableDisplayDate.dataSource = self
        getCurhatFromCoreData()
        getTodayCurhat()
        printListCurhat()
        
    }
    func printListCurhat(){
        for item in listTodayCurhat! {
            print( "\(item.date)\n")
        }
    }
    func getCurhatFromCoreData(){
        do {
            self.listCurhat = try context.fetch(Curhat.fetchRequest())
            DispatchQueue.main.async {
                self.tableDisplayDate.reloadData()
            }
        } catch  {
        }
    }
    func getTodayCurhat(){
        for i in listCurhat! {
            let compareDay = Calendar.current.compare(curhat!.date!, to: i.date!, toGranularity: .day)
            if compareDay.rawValue == 0 {
                listTodayCurhat?.append(i)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTodayCurhat!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCellController
        let currentContent = self.listTodayCurhat![indexPath.row]
        cell.dateLabel.text = formatter.string(from: currentContent.date!)
        cell.emojiLabel.text = currentContent.emoji
        cell.feelingLabel.text = currentContent.feeling
        return cell
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