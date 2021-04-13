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
    struct CurhatPerDay {
        var curhatPerDay:[Curhat]!
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
        groupTable()
    }
    func sortTable(){
        listCurhat?.sort(by: { ($0.date! > $1.date!)
        })
    }
    func groupTable(){
        
        var previousMonth = listCurhat?.first
        var isGroupedListCurhatHasValue : Bool = false
        for i in listCurhat! {
            let countMonth = Calendar.current.dateComponents([.month], from: (previousMonth?.date)!, to:i.date! ).month!
            
            let compareMonth = Calendar.current.compare(previousMonth!.date!, to: i.date!, toGranularity: .month)
            print("\(compareMonth.rawValue) segment : \(segmentCounter)")
            print("CountMonth : \(countMonth) previous month : \(previousMonth?.date) currentmonth : \(i.date)")
            previousMonth = i
            if(compareMonth.rawValue == 1){
                segmentCounter+=1
                print("Section \(segmentCounter-1) has \(tempListCurhat.count) objects")
                if(!isGroupedListCurhatHasValue){
                    groupedListCurhat.insert(tempListCurhat, at: 0)
                    isGroupedListCurhatHasValue = true
                }else{
                    groupedListCurhat.append(tempListCurhat)
                }
                
                for a in tempListCurhat {
                    print("\(a.date) Appended\n")
                }
                tempListCurhat = []
                tempListCurhat.append(i)
            }else{
                tempListCurhat.append(i)
            }
        }
        groupedListCurhat.append(tempListCurhat)
        print("")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return segmentCounter+1
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

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.groupedListCurhat[section].count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
        return ("section \(section)")
            //formatter.string(from: (self.groupedListCurhat[section][0].date)!)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCellController
        let currentContent = self.groupedListCurhat[indexPath.section][indexPath.row]
        cell.dateLabel.text = formatter.string(from: currentContent.date!)
        cell.emojiLabel.text = currentContent.emoji
        cell.feelingLabel.text = currentContent.feeling
        return cell
    }
}
