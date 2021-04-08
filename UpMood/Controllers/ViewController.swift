//
//  ViewController.swift
//  page control
//
//  Created by theodore teofillius on 06/04/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var emotionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        emotionTableView.delegate = self
        emotionTableView.dataSource = self
    }
    
    var dataSeed: [Emotion] = [Emotion(isChecked: false, emoji: "👨‍👨‍👧‍👦", emotion: "Family"),
                               Emotion(isChecked: true, emoji: "📚", emotion: "Study")]
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row > 3 {
        let customCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let data = dataSeed[indexPath.row]
        customCell.editCustomCellText(from: data.emoji, from: data.emotion, status: data.isEditable)
        return customCell
//        }
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "emotionCell", for: indexPath)
//        cell.textLabel?.text = "jason"
//        let emotionSwitch = UISwitch()
//        emotionSwitch.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
//        cell.editingAccessoryType = UITableViewCell.AccessoryType.checkmark
//        cell.accessoryView = emotionSwitch
        
//        return cell
    }
    
    

    
    
    @objc func didChangeSwitch(_ sender: UISwitch){
        if sender.isOn {
            print("ON")
        } else {
            print("OFF ")
        }
    }
    private let scrollView = UIScrollView()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.backgroundColor = .systemBlue
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(self,
                              action: #selector(pageControlDidChange(_:)),
                              for: .valueChanged)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width,
                                            y: 0), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect (x:10,y:view.frame.size.height-100,width: view.frame.size.width-20, height: 70)
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-100)
        if scrollView.subviews.count == 2 {
            configureScrollView()
            
        }
        
    }
    private func configureScrollView(){
        scrollView.contentSize = CGSize(width: view.frame.size.width*3, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let colors: [UIColor] = [
            .systemRed,
            .systemGray,
            .systemGreen
        ]
        
        for x in 0..<3 {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            page.backgroundColor = colors[x]
            scrollView.addSubview(page)
        }
    }
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollview: UIScrollView){
        pageControl.currentPage = Int(floorf(Float(scrollview.contentOffset.x) / Float(scrollview.frame.size.width)))
    }
}
