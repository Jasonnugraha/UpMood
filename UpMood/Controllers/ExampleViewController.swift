//
//  ExampleViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

class ExampleViewController: UIViewController {

    let dataFeelings: [DataExample] = [DataExample(detailemot: "Family"), DataExample(detailemot: "Friends"), DataExample(detailemot: "Work"), DataExample(detailemot: "Work")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension ExampleViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFeelings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ex", for: indexPath)
        
        let dakta = dataFeelings[indexPath.row]
        
        
        
        //ganti label
        //cell.textLabel?.text = "gambar \(indexPath.row)"
        //cell.detailTextLabel?.text = "Parents"
        
        cell.textLabel?.text = dakta.detailemot
        //cell.detailTextLabel?.text = dakta.detailemot
        let tempDetail = dakta.detailemot
        

        
        //Validasi Status Feelingsnya untuk menampilkan gambar (Hanya perlu mengambil statusnya dari DB)
        if tempDetail == "Family"{
            cell.imageView?.image = #imageLiteral(resourceName: "Arti-emoticon-keluarga-dan-anak.jpeg")
        } else if tempDetail == "Friends"{
            cell.imageView?.image = #imageLiteral(resourceName: "FriendsTemp")
        } else if tempDetail == "Work"{
            cell.imageView?.image = #imageLiteral(resourceName: "man-technologist-app")
        }

        return cell
        
    }
  
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? PageViewController {
            
        }
    }
 */
    
    
}
