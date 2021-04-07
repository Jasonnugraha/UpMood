//
//  ViewController.swift
//  page control
//
//  Created by theodore teofillius on 06/04/21.
//

import UIKit

class ViewController: UIViewController {

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
