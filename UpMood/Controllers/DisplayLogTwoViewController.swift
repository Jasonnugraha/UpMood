//
//  DisplayLogTwoViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 10/04/21.
//

import UIKit
import CoreData

class DisplayLogTwoViewController: UIViewController {

/*
    var selectedCategory: Category?{
        didSet{
            //loadItems() -> melakukan load data yg disimpan dari core data (nb: entitynya beda)
        }
    }
 */
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //var timeArray = [time]() //buat coredata time dulu //menyimpan data time dari Oneviewcontroller file
   // var timeArray = [Time]() //nama entity di Core Data
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 /*
    //Mark - Tableview datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Time.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: indexPath) //identifier = nama cell dari yg akan kita parsing
        cell.textLabel?.text = categories[indexPath.row].name //name disini adalah nama atribut yg akan kita panggil dari core data
        
        return cell
    }
    
    //Mark - Data manipulation method
    func loadTableTime(){
        do{
            let request : NSFetchRequest<Time> = Time.fetchRequests() //ngambil semua Data yg ada di coreData entity Time
        } catch{
            print("Error loading coredata ... \(error)")
        }
        tableView.reloadData
    }
 */
    
    
    
    //Mark - Tableview Delegate method (yg terjadi ketika kita klik salah satu row table)
    

    

    

}
