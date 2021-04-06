//
//  SliderViewController.swift
//  Slider
//
//  Created by Pieter Yonathan on 06/04/21.
//

import UIKit

class SliderViewController: UIViewController {

    var emot = [String]()
    var labelemo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backslider.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.99, alpha: 1)
        backslider.layer.cornerRadius = 10
        view.addSubview(backslider)
      
        
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
        backemo.layer.addSublayer(gradient)
        backemo.layer.cornerRadius = 35
        
        emot = ["☺️", "😊", "🙂", "😒", "😓", "😣", "😥", "😨", "😰"]
        labelemo = ["Calm", "Comfortable", "Okay", "Annoyed", "Nervous", "Anxious", "Worried", "Fearful", "Panicked" ]
        
    }
    
    @IBAction func slider(_ sender: UISlider) {
        let value = Int (sender.value)
        emoticon.text = emot[value]
        infoemot.text = labelemo[value]
    }
    
    @IBOutlet weak var infoemot: UILabel!
    @IBOutlet weak var emoticon: UILabel!
    @IBOutlet weak var backemo: UIView!
    @IBOutlet weak var backslider: UIView!
    
    
}
