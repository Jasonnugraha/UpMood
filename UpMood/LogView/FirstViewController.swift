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
    var listOfEmoji : [String] = []
    var listOfDesc : [String] = []
    let feelings: [DataDefaultFeelings] = [DataDefaultFeelings(emotion: "☺️", feeling: "Calm")]
    var dataSeed: [Labels] = [Labels(isChecked: false, emojiLogo: "👨‍👨‍👧‍👦", reason: "Family", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "👯‍♀️", reason: "Friend", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "⛅️", reason: "Weather", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "📝", reason: "School", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "💓", reason: "Relationship", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "👤", reason: "Self", isEditable: false),
                              Labels(isChecked: false, emojiLogo: "💼", reason: "Work", isEditable: false)]


    @IBAction func buttonEditDidTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toEditPage", sender: self)
    }
    
    @IBOutlet weak var textViewArea: UITextView!
    @IBOutlet weak var backEmo: UIImageView!
    @IBOutlet weak var feelingsToday: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var tableCellFeelings: UITableView!
    @IBOutlet weak var emoticon: UILabel!
    

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var summary: Curhat?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print( "viewWillAppear is Called")
        textViewArea.delegate = self
        textViewArea.layer.cornerRadius = 8
        textViewArea.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        textViewArea.text = "Today I feel realy good, I had a good sleep and woke up feeling refreshed. My family also prepared a nice breakfast. We had a nice meal together and then I felt to meet friends. We talked the entire time we ere on the bus until we both reached our destinations. What a good way to start the day!"
        
        
        //MARK - UNTUK DISPLAY CAUSE OF FEELING
        listOfDesc = summary!.causeOfFeelingDesc!
        listOfEmoji = summary!.causeOfFeelingEmoji!
               //MARK - Default Emot
        let defaultEmot = "☺️".textToImage()

        //MARK - Date
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        labelTime.text = formatter.string(from: (summary?.date)!)
    
        formatter.dateFormat = "dd MMMM yyyy"
        labelDate.text = formatter.string(from: (summary?.date)!)
        
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
        tableCellFeelings.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9490196078, blue: 0.9882352941, alpha: 1)
        tableCellFeelings.layer.cornerRadius = 10
        
        
        backgroundEmot()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewArea.delegate = self
        textViewArea.layer.cornerRadius = 10
        textViewArea.text = "Today I feel realy good, I had a good sleep and woke up feeling refreshed. My family also prepared a nice breakfast. We had a nice meal together and then I felt to meet friends. We talked the entire time we ere on the bus until we both reached our destinations. What a good way to start the day!"
        
        
        //MARK - UNTUK DISPLAY CAUSE OF FEELING
        listOfDesc = summary!.causeOfFeelingDesc!
        listOfEmoji = summary!.causeOfFeelingEmoji!
               //MARK - Default Emot
        let defaultEmot = "☺️".textToImage()

        //MARK - Date
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        labelTime.text = formatter.string(from: (summary?.date)!)
    
        formatter.dateFormat = "dd MMMM yyyy"
        labelDate.text = formatter.string(from: (summary?.date)!)
        
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
        tableCellFeelings.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9490196078, blue: 0.9882352941, alpha: 1)
        tableCellFeelings.layer.cornerRadius = 10
        
        
        backgroundEmot()
        
    }
    func backgroundEmot(){
        let tempBackgroundEmot = summary?.feeling
    
        if tempBackgroundEmot == "Calm"{
            backEmo.image = #imageLiteral(resourceName: "01-calm")
            feelingsToday.textColor = #colorLiteral(red: 0.2470588235, green: 0.6117647059, blue: 0.9137254902, alpha: 1)
        } else if tempBackgroundEmot == "comfortable"{
            backEmo.image = #imageLiteral(resourceName: "02-comfortable")
            feelingsToday.textColor = #colorLiteral(red: 0.2745098039, green: 0.5607843137, blue: 0.9176470588, alpha: 1)
        }
        else if tempBackgroundEmot == "Okay"{
            backEmo.image = #imageLiteral(resourceName: "03-okay")
            feelingsToday.textColor = #colorLiteral(red: 0.2980392157, green: 0.5098039216, blue: 0.9176470588, alpha: 1)
        }
        else if tempBackgroundEmot == "Annoyed"{
            backEmo.image = #imageLiteral(resourceName: "04-annoyed")
            feelingsToday.textColor = #colorLiteral(red: 0.3137254902, green: 0.462745098, blue: 0.9215686275, alpha: 1)
        }
        else if tempBackgroundEmot == "Nervous"{
            backEmo.image = #imageLiteral(resourceName: "05-nervous")
            feelingsToday.textColor = #colorLiteral(red: 0.3333333333, green: 0.4117647059, blue: 0.9215686275, alpha: 1)
        }
        else if tempBackgroundEmot == "Anxious"{
            backEmo.image = #imageLiteral(resourceName: "06-anxious")
            feelingsToday.textColor = #colorLiteral(red: 0.3450980392, green: 0.3607843137, blue: 0.9215686275, alpha: 1)
        }
        else if tempBackgroundEmot == "Worried"{
            backEmo.image = #imageLiteral(resourceName: "07-worried")
            feelingsToday.textColor = #colorLiteral(red: 0.3607843137, green: 0.3215686275, blue: 0.9254901961, alpha: 1)
        }
        else if tempBackgroundEmot == "Fearful"{
            backEmo.image = #imageLiteral(resourceName: "08-fearful")
            feelingsToday.textColor = #colorLiteral(red: 0.4156862745, green: 0.3176470588, blue: 0.9215686275, alpha: 1)
        }
        else if tempBackgroundEmot == "Panicked"{
            backEmo.image = #imageLiteral(resourceName: "09-panicked")
            feelingsToday.textColor = #colorLiteral(red: 0.4705882353, green: 0.3176470588, blue: 0.9215686275, alpha: 1)
        }else {
            backEmo.image = #imageLiteral(resourceName: "09-panicked")
            feelingsToday.textColor = #colorLiteral(red: 0.4705882353, green: 0.3176470588, blue: 0.9215686275, alpha: 1)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toEditPage"){
            //let destinationVC = segue.destination as! FirstViewController //ini udah bener
            let destinationVC = segue.destination as! TableViewController
            destinationVC.curhat = self.summary
        } else {
            return
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
        return listOfDesc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: ReusableReasonCell.identifier, for: indexPath) as! ReusableReasonCell
        let data : Labels = Labels(isChecked: false, emojiLogo:listOfEmoji[indexPath.row] , reason:listOfDesc[indexPath.row], isEditable: false)
        customCell.editReasonCell(from: data)
        
        //MARK - ViewCell
        customCell.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9490196078, blue: 0.9882352941, alpha: 1)
        //customCell.layer.cornerRadius = 10
        
        return customCell
    }
}

