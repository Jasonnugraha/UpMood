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
    var segmentCounter = 1
    var listCurhat:[Curhat]!
    var groupedListCurhat:[[Curhat]] = [[]]
    var tempListCurhat:[Curhat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSavedData.delegate = self
        tableSavedData.dataSource = self
        getCurhatFromCoreData()
        sortTable()
        groupTable()
    }
    
    func sortTable(){
        listCurhat?.sort(by: { ($0.date! > $1.date!)
        })
    }
    func groupTable(){
        
        var previousMonth = listCurhat?.first
        var previousDay = listCurhat?.first
        for i in listCurhat! {
            let compareMonth = Calendar.current.compare(previousMonth!.date!, to: i.date!, toGranularity: .month)
            print("\(compareMonth.rawValue) segment : \(segmentCounter)")
            print(" previous month : \(previousMonth?.date) currentmonth : \(i.date)")
            previousMonth = i
            if(compareMonth.rawValue == 1){
                segmentCounter+=1
                groupedListCurhat.append(tempListCurhat)
                tempListCurhat = []
                
            }
            let compareDay = Calendar.current.compare(previousDay!.date!, to: i.date!, toGranularity: .day)
            if(compareDay.rawValue == 1){
                previousDay = i
                tempListCurhat.append(i)
            }else if(i.date == previousDay?.date){
                tempListCurhat.append(i)
            }
            
        }
        
        groupedListCurhat.append(tempListCurhat)
        print("")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return segmentCounter
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //PerformSague
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

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.groupedListCurhat[section+1].count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
        return formatter.string(from: (self.groupedListCurhat[section+1][0].date)!)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCellController
        let currentContent = self.groupedListCurhat[indexPath.section+1][indexPath.row]
        cell.dateLabel.text = formatter.string(from: currentContent.date!)
        cell.emojiLabel.text = currentContent.emoji
        cell.feelingLabel.text = currentContent.feeling
        return cell
    }
}
