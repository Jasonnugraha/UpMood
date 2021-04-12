//
//  ThirdViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 07/04/21.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    //MARK - Tangkep Data Journaling by Time
/*    var selectedByTime: Timee?{
        didSet{
            loadItem()
        }
    }
 */
    //MARK - Variable penampung
    var emot: String?
    //var tableBcs = [Journaling]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Mark - Tableview datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return Becauseof.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: indexPath) //identifier = nama cell dari yg akan kita parsing
        
        //cell.textLabel?.text = categories[indexPath.row].name //name disini adalah nama atribut yg akan kita panggil dari core data, misal name
        
        return cell
    }

/*
    //Mark - Data manipulation method
        func loadTableTime(){
            do{
                let request : NSFetchRequest<Journaling> = Journaling.fetchRequests() //ngambil semua Data yg ada di coreData entity Time/Journaling
            } catch{
                print("Error loading coredata ... \(error)")
            }
            tableView.reloadData
        }

        func loadItem(with request: NSFetchRequest<Journaling> = Journaling.fetchRequest()){
            let predicate = NSPredicate(format:"parentTime.name MATCHES %@", selectedByTime!.name!) //parentTime itu didapet dari relatioship pada CoreData //selected by time diambil dari atas
            request.predicate = predicate
                    
            do{
                itemArray= try context.fetch(request)
            }catch{
                print("error")
            }

        }
 */
 

    
}
