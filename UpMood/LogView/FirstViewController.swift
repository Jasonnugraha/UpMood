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
    var dataSeed: [Labels] = [Labels(isChecked: false, emojiLogo: "👨‍👨‍👧‍👦", reason: "Family", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "👯‍♀️", reason: "Friend", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "⛅️", reason: "Weather", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "📝", reason: "School", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "💓", reason: "Relationship", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "👤", reason: "Self", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "💼", reason: "Work", isEditable: false)]

    @IBOutlet weak var textViewArea: UITextView!
    @IBOutlet weak var backEmo: UIImageView!
    @IBOutlet weak var feelingsToday: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var tableCellFeelings: UITableView!
    @IBOutlet weak var emoticon: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var summary: Curhat?

    override func viewDidLoad() {
        super.viewDidLoad()
        textViewArea.delegate = self
        textViewArea.layer.cornerRadius = 10
        textViewArea.text = "Today I feel realy good, I had a good sleep and woke up feeling refreshed. My family also prepared a nice breakfast. We had a nice meal together and then I felt to meet friends. We talked the entire time we ere on the bus until we both reached our destinations. What a good way to start the day!"
        
        //MARK - Default Emot
        let defaultEmot = "☺️".textToImage()

        //MARK - Date
        let formatter = DateFormatter()
        formatter.timeStyle = .short
//      formatter.dateStyle = .short
        labelTime.text = formatter.string(from: (summary?.date)!)
        
        //Mark - Feelings & Emot
        feelingsToday.text = summary?.feeling
        emoticon.text = summary?.emoji
        
        //Mark - textViewArea
        textViewArea.text = summary?.desc
        
        //MARK - Table Cell BecauseOf
//        tableCellFeelings.delegate = self
//        tableCellFeelings.dataSource = self
//        tableCellFeelings.backgroundColor = UIColor.clear
//        tableCellFeelings.isScrollEnabled = true
        tableCellFeelings.register(ReusableReasonCell.nib(), forCellReuseIdentifier: ReusableReasonCell.identifier)
        tableCellFeelings.delegate = self
        tableCellFeelings.dataSource = self
        
        backgroundEmot()
        feelingsToday.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

    }
    func backgroundEmot(){
        let tempBackgroundEmot = summary?.feeling
        if tempBackgroundEmot == "calm"{
            backEmo.image = #imageLiteral(resourceName: "01-calm")
            //feelingsToday.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else if tempBackgroundEmot == "comfortable"{
            backEmo.image = #imageLiteral(resourceName: "02-comfortable")
        }
        else if tempBackgroundEmot == "okay"{
            backEmo.image = #imageLiteral(resourceName: "03-okay")
        }
        else if tempBackgroundEmot == "annoyed"{
            backEmo.image = #imageLiteral(resourceName: "04-annoyed")
        }
        else if tempBackgroundEmot == "nervous"{
            backEmo.image = #imageLiteral(resourceName: "05-nervous")
        }
        else if tempBackgroundEmot == "anxious"{
            backEmo.image = #imageLiteral(resourceName: "06-anxious")
        }
        else if tempBackgroundEmot == "worried"{
            backEmo.image = #imageLiteral(resourceName: "07-worried")
        }
        else if tempBackgroundEmot == "fearful"{
            backEmo.image = #imageLiteral(resourceName: "08-fearful")
        }
        else if tempBackgroundEmot == "panicked"{
            backEmo.image = #imageLiteral(resourceName: "09-panicked")
        }else {
            backEmo.image = #imageLiteral(resourceName: "09-panicked")
        }
        
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
/*
extension FirstViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return becauseOf.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feel", for: indexPath)
        let dakta = becauseOf[indexPath.row]
        
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

        return cell
    }
 
}
*/

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

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: ReusableReasonCell.identifier, for: indexPath) as! ReusableReasonCell
        let data = dataSeed[indexPath.row]
        customCell.editReasonCell(from: data.emojiLogo, from: data.reason, status: false)
        
        return customCell
    }
}
