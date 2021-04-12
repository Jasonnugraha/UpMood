//
//  DisplayLogsOneViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 10/04/21.
//

import UIKit

class DisplayLogsOneViewController: UIViewController {
    //let dataFeelings: [DataExample] = [DataExample(emot: "😊", detailemot: "parents")]
    let dataFeelings: [DataExample] = [DataExample(detailemot: "Family"), DataExample(detailemot: "Friends"), DataExample(detailemot: "Work"), DataExample(detailemot: "Campus")
    ]
    
    @IBOutlet weak var tableCellFeelings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Table Cell Feelings
                //tableCellFeelings.imageView?.image = imageOri
                tableCellFeelings.delegate = self
                tableCellFeelings.dataSource = self
                
                //remove background color yg ga senada
                tableCellFeelings.backgroundColor = UIColor.clear
                //tableCellFeelings.backgroundView = nil
                
                //TurnOff Scroll Table View
                tableCellFeelings.isScrollEnabled = true
    }
}

//nentuin jumlah kotaknya pakai function delegate
extension DisplayLogsOneViewController: UITableViewDelegate, UITableViewDataSource {
    //jumlah row
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10 -> mengembalikan 10 table
        //dynamic dan jumlahnya sesuai dgn yg ada di list
        return dataFeelings.count
        //count mengembalikan jumlah item yg ada di dalam array
    }
    
    //datanya -> mengatur UI -> mereturn cell ui
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //template untuk ngambil
        let cell = tableView.dequeueReusableCell(withIdentifier: "feel", for: indexPath)
        
        //cell.selectionStyle = .blue
        cell.backgroundColor = .systemPurple
        //cell.backgroundView = nil


        
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
