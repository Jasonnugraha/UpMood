//
//  FirstViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 09/04/21.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITextViewDelegate{
    //MARK - Data Dummy From Struct
    let becauseOf: [DataDefault] = [DataDefault(detailemot: "Family"), DataDefault(detailemot: "Friends"), DataDefault(detailemot: "Weather")
    ]
    let feelings: [DataDefaultFeelings] = [DataDefaultFeelings(emotion: "☺️", feeling: "Calm")]

    @IBOutlet weak var textViewArea: UITextView!
    @IBOutlet weak var backEmo: UIImageView!
    @IBOutlet weak var emot: UIImageView!
    @IBOutlet weak var feelingsToday: UILabel!
    
    
    @IBOutlet weak var tableCellFeelings: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var summary: [Curhat]?
    //var temp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewArea.delegate = self
        textViewArea.layer.cornerRadius = 10
        textViewArea.text = "Today I feel realy good, I had a good sleep and woke up feeling refreshed. My family also prepared a nice breakfast. We had a nice meal together and then I felt to meet friends. We talked the entire time we ere on the bus until we both reached our destinations. What a good way to start the day!"
        
        //MARK - Default Emot
        let defaultEmot = "☺️".textToImage()
        emot.image = defaultEmot
        
        //let temp = feelings[index(ofAccessibilityElement: <#T##Any#>)]
        //let tempEmot = temp?.textToImage()
        //emot.image = tempEmot
        //let convert = tempEmot
        
        //emot.image = convert
/*
        let dakta = becauseOf[indexPath.row]
        let tempDetail = dakta.detailemot
        cell.textLabel?.text = tempDetail
 */
        
        //MARK - Table Cell BecauseOf
        tableCellFeelings.delegate = self
        tableCellFeelings.dataSource = self
        tableCellFeelings.backgroundColor = UIColor.clear
        tableCellFeelings.isScrollEnabled = true
        
        backgroundEmot()
        feelingsToday.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        //let uuid = UUID().uuidString
        //print(uuid)
        
        //getCurhatFromCoreData()
      
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
    func getCurhatFromCoreData(){
        do {
            try context.fetch(Curhat.fetchRequest())
            self.textViewArea.reloadInputViews()
/*            DispatchQueue.main.async {
                self.tableSavedData.reloadData()
            }
*/
        } catch  {
            print("error")
        }
    }
    
*/
}

/*
extension FirstViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        <#code#>
    }
}
*/

extension FirstViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return becauseOf.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feel", for: indexPath)
        let dakta = becauseOf[indexPath.row]
        //print(dakta)
        
        let tempDetail = dakta.detailemot
        cell.textLabel?.text = tempDetail
        
        //MARK - Validasi status Feelings
        let imageOri = "👪".textToImage() //convert string to image -> String Emotnya diambil dari Core Data
        let imageOri2 = "👯".textToImage()
        let imageOri3 = "⛅️".textToImage()
        
        if tempDetail == "Family"{
                    cell.imageView?.image = imageOri
        } else if tempDetail == "Friends"{
                    cell.imageView?.image = imageOri2
        } else if tempDetail == "Weather"{
                    cell.imageView?.image = imageOri3
        }
/*
        let dakta2 = feelings[indexPath.row]
        let ambildata = dakta2.emotion
        temp = ambildata
        print(temp!)
*/
        
        return cell
    }
    
    
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


