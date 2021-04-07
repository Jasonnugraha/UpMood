//
//  FirstViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 06/04/21.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var feelingsLabel: UILabel!
    @IBOutlet weak var backEmo: UIImageView!
    @IBOutlet weak var emot: UIImageView!
    @IBOutlet weak var textViewMind: UITextView!
    @IBOutlet weak var tableCellFeelings: UITableView!
    
    //let dataFeelings: [DataExample] = [DataExample(emot: "😊", detailemot: "parents")]
    let dataFeelings: [DataExample] = [DataExample(detailemot: "Family"), DataExample(detailemot: "Friends"), DataExample(detailemot: "Work"), DataExample(detailemot: "Work")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Emot & Background Feelings
        backEmo.layer.cornerRadius = 35
        backEmo.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        //convert string to image
        let imageOri = "😊".textToImage()
        emot.image = imageOri
        //->Next, cara ngambil emot dari db terus jadiin image
        
        
        //input text area
        textViewMind.layer.cornerRadius = 10
        
        //Table Cell Feelings
        //tableCellFeelings.imageView?.image = imageOri
        tableCellFeelings.delegate = self
        tableCellFeelings.dataSource = self
        
        //remove background color yg ga senada
        tableCellFeelings.backgroundColor = .white
        tableCellFeelings.backgroundView = nil
        
        //TurnOff Scroll Table View
        tableCellFeelings.isScrollEnabled = false
        
        
    }
    

    

}

//nentuin jumlah kotaknya pakai function delegate
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    
}


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

