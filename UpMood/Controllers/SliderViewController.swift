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
