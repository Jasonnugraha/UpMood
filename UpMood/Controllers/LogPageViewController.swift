//
//  LogPageViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 09/04/21.
//
//KODE DISINI MENGATUR SI PAGE VIEW CONTROLLERNYA

import UIKit

class LogPageViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var x: Int?
    //var x = 2
/*
    lazy var orderedViewControllers: [UIViewController] = {

        let sb = UIStoryboard(name: "Logview", bundle: nil)
        let vc1 = sb.instantiateViewController(identifier: "firstStory")
        let vc2 = sb.instantiateViewController(identifier: "secondStory")
        let vc3 = sb.instantiateViewController(identifier: "thirdStory")
        
        var viewControllers = [UIViewController]()


        if x == 1 {
            //return [vc1]
            viewControllers.append(vc1)
            //cek index
            print(viewControllers.firstIndex(of: vc1)!)
            //let index = 0
        } else if x == 2 {
            viewControllers.append(vc1)
            viewControllers.append(vc2)
            print(viewControllers.firstIndex(of: vc1)!)
            print(viewControllers.firstIndex(of: vc2)!)
        } else if x == 3 {
            viewControllers.append(vc1)
            viewControllers.append(vc2)
            viewControllers.append(vc3)
        }
        
        return viewControllers
    }()
 */

    
    var currentPageIndex:Int = 0
        var pageviewcontroller:UIPageViewController!
        var ViewControllers: [UIViewController] = []
        var pageControl = UIPageControl()
        
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.pageviewcontroller = (self.storyboard?.instantiateViewController(withIdentifier: "PageViewControllerLog") as! UIPageViewController)
        self.pageviewcontroller.dataSource = self
        self.pageviewcontroller.delegate = self
        
        if x == 1 {
            ViewControllers.append(
                        UIStoryboard(name: "LogViews", bundle: nil) .
                            instantiateViewController(withIdentifier: "pageLog1"))
        } else if x == 2 {
            ViewControllers.append(
                        UIStoryboard(name: "LogViews", bundle: nil) .
                            instantiateViewController(withIdentifier: "pageLog1"))
            ViewControllers.append(
                UIStoryboard(name: "LogViews", bundle: nil) .
                    instantiateViewController(withIdentifier: "pageLog2"))
        } else if x == 3 {
            ViewControllers.append(
                        UIStoryboard(name: "LogViews", bundle: nil) .
                            instantiateViewController(withIdentifier: "pageLog1"))
            ViewControllers.append(
                UIStoryboard(name: "LogViews", bundle: nil) .
                    instantiateViewController(withIdentifier: "pageLog2"))
            ViewControllers.append(
                UIStoryboard(name: "LogViews", bundle: nil) .
                    instantiateViewController(withIdentifier: "pageLog3"))
        }
                
        
        if let firstViewController = ViewControllers.first {
            self.pageviewcontroller.setViewControllers([firstViewController],
                                               direction: .forward,
                                               animated: true,
                                               completion: nil)
            }

        //Menampilkan page viewnya
        self.pageviewcontroller.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-50)
                        
            self.addChild(pageviewcontroller)
            self.view.addSubview(pageviewcontroller.view)
            self.pageviewcontroller.didMove(toParent: self)

        //self.configurePageControl()
        configurePageControl()
                
    }
    
    //gambar button page control
        func configurePageControl() {
            pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
            pageControl.numberOfPages = ViewControllers.count
            pageControl.currentPage = 0
            pageControl.tintColor = UIColor.black
            pageControl.pageIndicatorTintColor = UIColor.white
            pageControl.currentPageIndicatorTintColor = UIColor.black
            self.view.addSubview(pageControl)
        }
        
    //BEFORE
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = ViewControllers.firstIndex(of: viewController) else {
                       return nil
                   }
                   
                   let previousIndex = viewControllerIndex - 1
                   
                   guard previousIndex >= 0 else {
                       return nil
                   }
                   
                   guard ViewControllers.count > previousIndex else {
                       return nil
                   }
                   
                   return ViewControllers[previousIndex]
        }
        
    //AFTER
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = ViewControllers.firstIndex(of: viewController) else {
                        return nil
                    }
                    
                    let nextIndex = viewControllerIndex + 1
                    //var baru untuk menghitung si ViewControllers
                    let ViewControllersCount = ViewControllers.count
                    
                    guard ViewControllersCount != nextIndex else {
                        return nil
                    }
                    
                    guard ViewControllersCount > nextIndex else {
                        return nil
                    }
                    
                    return ViewControllers[nextIndex]
        }
    

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = ViewControllers.firstIndex(of: pageContentViewController)!
    }

}
