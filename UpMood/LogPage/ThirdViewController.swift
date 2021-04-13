//
//  ThirdViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 07/04/21.
//

import UIKit

//class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

class ThirdViewController: UIViewController{
    @IBOutlet weak var textViewArea: UITextView!
    @IBOutlet weak var backEmo: UIImageView!
    @IBOutlet weak var feelingsToday: UILabel!
    
    //MARK - Tangkep Data Journaling by Time
/*    var selectedByTime: Timee?{
        didSet{
            loadItem()
        }
    }
 */
    //MARK - Variable penampung
//    var emot: String?
    //var tableBcs = [Journaling]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundEmot()
        feelingsToday.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        textViewArea.layer.cornerRadius = 10
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
    //Mark - Tableview datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return Becauseof.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pageLog3", for: indexPath) //identifier = nama cell dari yg akan kita parsing
        
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
 
 */
 

    
}
