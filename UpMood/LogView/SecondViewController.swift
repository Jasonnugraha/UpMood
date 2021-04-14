//
//  SecondViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 06/04/21.
//

import UIKit


class SecondViewController: UIViewController, UITextViewDelegate {
    //MARK - Data Dummy From Struct
    let becauseOf: [DataDefault] = [DataDefault(detailemot: "Organization"),
    ]
    
    @IBOutlet weak var textViewArea: UITextView!
    @IBOutlet weak var backEmo: UIImageView!
    @IBOutlet weak var emot: UIImageView!
    @IBOutlet weak var feelingsToday: UILabel!
    @IBOutlet weak var tableCellFeelings: UITableView!
    //Buat refrence to managed object context
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK - TextField
        textViewArea.delegate = self
        textViewArea.text = "Nobody told me we were supposed to have a meeting. It wasn't in my calendar!"
        textViewArea.layer.cornerRadius = 10
        
        //MARK - Default Emot
        let defaultEmot = "😒".textToImage()
        emot.image = defaultEmot
        
        //MARK - Table Cell BecauseOf
        tableCellFeelings.delegate = self
        tableCellFeelings.dataSource = self
        tableCellFeelings.backgroundColor = UIColor.clear
        tableCellFeelings.isScrollEnabled = true
        
        //MARK - Emot Feelings
        backgroundEmot()
        feelingsToday.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return becauseOf.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feel", for: indexPath)
        let dakta = becauseOf[indexPath.row]
        

        let tempDetail = dakta.detailemot
        cell.textLabel?.text = tempDetail
        
        //MARK - Validasi status Feelings
        let imageOri = "👥".textToImage() //convert string to image -> String Emotnya diambil dari Core Data
        let imageOri2 = "🐣".textToImage()
                
        if tempDetail == "Family"{
                    cell.imageView?.image = imageOri
        } else if tempDetail == "Friends"{
                    cell.imageView?.image = imageOri2
        } else if tempDetail == "Weather"{
                    cell.imageView?.image = imageOri
        } else if tempDetail == "Organization"{
            cell.imageView?.image = imageOri
        }

        return cell
    }
    
    
}


// MARK - String to Image
extension String {
    func textToImage2() -> UIImage? {
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

//Note :
//validasi -> kalau index di log == index
//validasi -> kalau waktu == AM, jalanin ini
