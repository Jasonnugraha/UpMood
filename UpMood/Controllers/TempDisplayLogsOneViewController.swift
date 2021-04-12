//
//  TempDisplayLogsOneViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 10/04/21.
//

import UIKit
import CoreData

class TempDisplayLogsOneViewController: UIViewController {
    let dataFeelings: [DataExample] = [DataExample(detailemot: "Family"), DataExample(detailemot: "Friends"), DataExample(detailemot: "Work"), DataExample(detailemot: "Campus")
    ]
    
    //MARK - Data temp
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataTime = [Time]() //nama entity di Core Data -> 1
    
    @IBOutlet weak var tableCellFeelings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableCellFeelings.delegate = self
        tableCellFeelings.dataSource = self
            
        tableCellFeelings.backgroundColor = UIColor.clear
        tableCellFeelings.isScrollEnabled = true
    }
}

extension TempDisplayLogsOneViewController: UITableViewDelegate, UITableViewDataSource {
    //jumlah row
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFeelings.count
        //return dataTime.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
/*
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: indexPath) //identifier = nama cell dari yg akan kita parsing
        cell.detailTextLabel?.text = categories[indexPath.row].text //name disini adalah nama atribut yg akan kita panggil dari core data, misal name
        
        return cell
  */
        
        
        //template untuk ngambil
        let cell = tableView.dequeueReusableCell(withIdentifier: "feel", for: indexPath)

        cell.backgroundColor = .systemPurple

        ////berjalan mengiterasikan. ini berjalan seusai jumlah count
        //kita ambil array ke berapa pakai row
        let dakta = dataFeelings[indexPath.row]
        
        
        //MARK - Change Label in Cell
        //cell.textLabel?.text = "gambar \(indexPath.row)"
        cell.detailTextLabel?.text = "Anxious/Calm/Comfortable"
        
        //cell.textLabel?.text = dakta.detailemot
        //cell.detailTextLabel?.text = dakta.detailemot
        let tempDetail = dakta.detailemot
        
        //MARK - Validasi status Feelings
        let imageOri = "😊".textToImage() //convert string to image -> String Emotnya diambil dari Core Data
        let imageOri2 = "🐣".textToImage()
        
        if tempDetail == "Family"{
            //cell.imageView?.image = #imageLiteral(resourceName: "Arti-emoticon-keluarga-dan-anak.jpeg")
            cell.imageView?.image = imageOri
        } else if tempDetail == "Friends"{
            cell.imageView?.image = imageOri2
        } else if tempDetail == "Work"{
            cell.imageView?.image = imageOri
        }

        return cell
    }
    
    //MARK - Table View Delagate Method (do next action with table)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.backgroundView = .none
        tableView.deselectRow(at: indexPath, animated: true)
        
        //performSegue(withIdentifier: "displayLog2 ", sender: self)
        //cek, cell yg mana yg dipilih
    }
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DisplayLogTwoViewController
        
        if let indexPath = tableCellFeelings.indexPathForSelectedRow {
            //destinationVC.selectedCategory = categories[indexPath.row] //categories ini adalah array dari file displayLogTwoVC
        }
    }
*/
}

/*
// MARK - String to Image
extension String {
    func textToImage() -> UIImage? {
        let nsString = (self as NSString)
        let font = UIFont.systemFont(ofSize: 1024) // you can change your font size here
        let stringAttributes = [NSAttributedString.Key.font: font]
        let imageSize = nsString.size(withAttributes: stringAttributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0) //  begin image context
        UIColor.clear.set() // clear background
        UIRectFill(CGRect(origin: CGPoint(), size: imageSize)) // set rect size
        nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes) // draw text within rect
        let image = UIGraphicsGetImageFromCurrentImageContext() // create image from context
        UIGraphicsEndImageContext() //  end image context

        return image ?? UIImage()
    }
 
}
 */

