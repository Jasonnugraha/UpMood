//
//  ViewController.swift
//  page control
//
//  Created by theodore teofillius on 06/04/21.
//

import UIKit
import Foundation

class TableViewController: UIViewController {
    var emot = [String]()
    var labelemo = [String]()
    
    var dataSeed: [Emotion] = [Emotion(isChecked: false, emoji: "👨‍👨‍👧‍👦", emotion: "Family"),
                               Emotion(isChecked: true, emoji: "📚", emotion: "Study")]
    
    @IBOutlet weak var emotionTableView: UITableView!
    @IBOutlet weak var infoemot: UILabel!
    @IBOutlet weak var emoticon: UILabel!
    @IBOutlet weak var backemo: UIView!
    @IBOutlet weak var backslider: UIView!
    @IBAction func slider(_ sender: UISlider) {
        let value = Int (sender.value)
        emoticon.text = emot[value]
        infoemot.text = labelemo[value]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Slider
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
        backemo.layer.insertSublayer(gradient, at: 0)
        
        emot = ["☺️", "😊", "🙂", "😒", "😓", "😣", "😥", "😨", "😰"]
        labelemo = ["Calm", "Comfortable", "Okay", "Annoyed", "Nervous", "Anxious", "Worried", "Fearful", "Panicked" ]
        
        // Table Delegate
        emotionTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        emotionTableView.delegate = self
        emotionTableView.dataSource = self
    }
    
    
    
}

// Emotion Controller

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let data = dataSeed[indexPath.row]
        customCell.editCustomCellText(from: data.emoji, from: data.emotion, status: data.isEditable)
        
        return customCell

    }
    
    

//    class SliderViewController: UIViewController {
//
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//
//
//        }
//
//
//
//
//    }

    

//    private let scrollView = UIScrollView()
//    
//    private let pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.numberOfPages = 3
//        pageControl.backgroundColor = .systemBlue
//        return pageControl
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        scrollView.delegate = self
//        pageControl.addTarget(self,
//                              action: #selector(pageControlDidChange(_:)),
//                              for: .valueChanged)
//        view.addSubview(scrollView)
//        view.addSubview(pageControl)
//    }
//    
//    @objc private func pageControlDidChange(_ sender: UIPageControl){
//        let current = sender.currentPage
//        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width,
//                                            y: 0), animated: true)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        pageControl.frame = CGRect (x:10,y:view.frame.size.height-100,width: view.frame.size.width-20, height: 70)
//        
//        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-100)
//        if scrollView.subviews.count == 2 {
//            configureScrollView()
//            
//        }
//        
//    }
//    private func configureScrollView(){
//        scrollView.contentSize = CGSize(width: view.frame.size.width*3, height: scrollView.frame.size.height)
//        scrollView.isPagingEnabled = true
//        let colors: [UIColor] = [
//            .systemRed,
//            .systemGray,
//            .systemGreen
//        ]
//        
//        for x in 0..<3 {
//            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
//            page.backgroundColor = colors[x]
//            scrollView.addSubview(page)
//        }
//    }
//}
//
//extension ViewController: UIScrollViewDelegate{
//    func scrollViewDidScroll(_ scrollview: UIScrollView){
//        pageControl.currentPage = Int(floorf(Float(scrollview.contentOffset.x) / Float(scrollview.frame.size.width)))
//    }
}
