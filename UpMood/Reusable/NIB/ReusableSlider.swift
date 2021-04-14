//
//  ReusableSlider.swift
//  UpMood
//
//  Created by Jason Nugraha on 09/04/21.
//

import UIKit
@IBDesignable
class ReusableSlider: UIView {
    
    let nibName = "ReusableSlider"
    var contentView:UIView?
    var emot = [String]()
    var labelemo = [String]()
    var gradbackemo = [UIImage]()
    
    //perdelegatean
    var delegate: TableViewControllerDelegate?
    var sliderValueDelegate: Int?
    
    
    @IBOutlet weak var infoemot: UILabel!
    @IBOutlet weak var emoticon: UILabel!
    @IBOutlet weak var backemo: UIView!
    @IBOutlet weak var backslider: UIView!
    @IBOutlet weak var grtbackemo: UIImageView!
    @IBOutlet weak var horizontalSlider: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        let value = Int (sender.value)
        emoticon.text = emot[value]
        infoemot.text = labelemo[value]
        grtbackemo.image = gradbackemo[value]
        delegate?.sliderValueChanged(sliderValue: value, infoEmot: infoemot.text,currentEmot: emoticon.text)
    }
    
    func initialSetup(){
        backslider.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.99, alpha: 1)
        backslider.layer.cornerRadius = 10
        self.addSubview(backslider)
      
        /* let gradient = CAGradientLayer()
        gradient.frame = CGRect(x:0, y:0, width: 73, height: 73)
        gradient.colors = [
            UIColor(red: 0.43, green: 0.7, blue: 0.93, alpha: 1).cgColor,
            UIColor(red: 0.25, green: 0.61, blue: 0.91, alpha: 1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 0.95)
        gradient.cornerRadius = 35
        backemo.layer.addSublayer(gradient)
        backemo.layer.cornerRadius = 35
        backemo.layer.insertSublayer(gradient, at: 0) */
        
        emot = ["☺️", "😊", "🙂", "😒", "😓", "😣", "😥", "😨", "😰"]
        labelemo = ["Calm", "Comfortable", "Okay", "Annoyed", "Nervous", "Anxious", "Worried", "Fearful", "Panicked" ]
        gradbackemo = [ #imageLiteral(resourceName: "01-calm"), #imageLiteral(resourceName: "02-comfortable"), #imageLiteral(resourceName: "03-okay"), #imageLiteral(resourceName: "04-annoyed"), #imageLiteral(resourceName: "05-nervous"), #imageLiteral(resourceName: "06-anxious"), #imageLiteral(resourceName: "07-worried"), #imageLiteral(resourceName: "08-fearful"), #imageLiteral(resourceName: "09-panicked") ]

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        self.initialSetup()
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

