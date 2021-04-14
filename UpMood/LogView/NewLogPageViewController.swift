//
//  ViewController.swift
//  repeatPageController
//
//  Created by DHIKA ADITYA ARE on 14/04/21.
//FILE BARU

import UIKit


class NewLogPageViewController:  UIPageViewController, UIPageViewControllerDataSource , UIPageViewControllerDelegate {

    //var pageControl = UIPageControl()
    //let pageVC3 = UIPageControl()
    var numberOfPages: Int?
    //var numberOfPages = 3
    //var x: Int?
    
/*
     lazy var VCArr : [UIViewController] = {

        return [self.VCInstance(name : "page")]

    }()
 */
    
    lazy var VCArr : [UIViewController] = {
           return []
       }()

    private func VCInstance(name : String) -> UIViewController {
        return UIStoryboard(name : "LogViews" , bundle : nil).instantiateViewController(withIdentifier: name)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0...numberOfPages! - 1 {
            VCArr.append(self.VCInstance(name : "pageLog1"))
        }
 

        var pageControl = UIPageControl.appearance()
        pageControl.layer.position.y = self.view.frame.height - 20
        pageControl.pageIndicatorTintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        pageControl.currentPageIndicatorTintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)

/*
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        //pageControl.numberOfPages = ViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
*/
        //Setting the background of the view controller so the dots wont be on a black background
        self.view.backgroundColor = UIColor.black
        self.dataSource = self
        self.delegate = self

        if let firstVC = VCArr.first {

            setViewControllers([firstVC] , direction: .forward , animated: true, completion: nil)
            setViewControllers([firstVC] , direction: .reverse , animated: true, completion: nil)

        }
 

    }
    
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for subV in self.view.subviews {
            if type(of: subV).description() == "UIPageControl" {

                let pos = CGPoint(x: 0, y: 600)
                subV.frame = CGRect(origin: pos, size: subV.frame.size)

            }
        }

        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            }else if view is UIPageControl{
                view.backgroundColor = UIColor.clear

            }
        }
    }



    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil

        }

        let previousIndex = viewControllerIndex-1
        guard previousIndex >= 0  else {
            return nil

        }

        guard VCArr.count > previousIndex else {
            return nil
        }

        return VCArr[previousIndex]
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = VCArr.firstIndex(of: viewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex+1
        guard nextIndex < VCArr.count
            else {
                return nil
        }

        guard VCArr.count > nextIndex else {
            return nil
        }

        return VCArr[nextIndex]
    }





    public func presentationCount(for pageViewController: UIPageViewController) -> Int{
        return 3
    }


    public func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        guard let firstViewController = viewControllers?.first , let firstViewControllerIndex = VCArr.index(of: firstViewController) else {
            return 0
        }


        return firstViewControllerIndex
    }


  }
