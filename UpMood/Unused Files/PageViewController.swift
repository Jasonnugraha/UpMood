//
//  PageViewController.swift
//  walktroughScreen
//
//  Created by DHIKA ADITYA ARE on 06/04/21.
//
// SOON TO BE DELETED MAYBE
//import UIKit
//
//class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
//
//    //cek kondisi di LOG
//    //var x: Int?
//    let x = 3
//    //var x = ""
//
//
//    lazy var orderedViewControllers: [UIViewController] = {
//        //BUAT KONDISI JUMLAH
//        //return [self.newVc(viewController: "firstStory"),
//               //self.newVc(viewController: "secondStory")]
//
//        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
//        let vc1 = sb.instantiateViewController(identifier: "onBoardingFirst")
//        let vc2 = sb.instantiateViewController(identifier: "onBoardingSecond")
//        let vc3 = sb.instantiateViewController(identifier: "onBoardingThird")
//
//        var viewControllers = [UIViewController]()
///*
//        for i in 1..<3{
//            viewControllers.append(vc1)
//            //viewControllers.append(vc2)
//        }
// */
//
////nested if for am/pm
//        if x == 1 {
//            //return [vc1]
//            viewControllers.append(vc1)
//            //cek index
//            print(viewControllers.firstIndex(of: vc1)!)
//            //let index = 0
//        } else if x == 2 {
//            viewControllers.append(vc1)
//            viewControllers.append(vc2)
//            print(viewControllers.firstIndex(of: vc1)!)
//            print(viewControllers.firstIndex(of: vc2)!)
//        } else if x == 3 {
//            viewControllers.append(vc1)
//            viewControllers.append(vc2)
//            viewControllers.append(vc3)
//        }
//
//
//        //return [vc1, vc2]
//        return viewControllers
//        /*if x == 1 {
//            return [self.newVc(viewController: "firstStory")]
//        }*/
//    }()
//
//
//
//
//
//    //Cek jumlah page 1.0
//    var pageControl = UIPageControl()
//
//    override func viewDidLoad() {
//        //print(x)
//        super.viewDidLoad()
//        self.dataSource = self
//        if let firstViewController = orderedViewControllers.first {
//            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
//        }
//
//        //page view button
//        self.delegate = self
//        configurePageControl()
//    }
//
//
//    //fungsi cek jumlah page 1.1
//    func configurePageControl(){
//        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
//        pageControl.numberOfPages = orderedViewControllers.count
//        pageControl.currentPage = 0
//        pageControl.tintColor = UIColor.black
//        pageControl.pageIndicatorTintColor = UIColor.gray
//        pageControl.currentPageIndicatorTintColor = UIColor.black
//        self.view.addSubview(pageControl)
//    }
//
///*
//    func newVc(viewController: String) -> UIViewController {
//        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
//    }
// */
//
//
//    //BEFORE
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
//            return nil
//        }
//        let previousIndex = viewControllerIndex - 1
//
//        guard  previousIndex >= 0 else {
//            //return orderedViewControllers.last
//            return nil
//        }
//
//        //kalau pakai for error disini
//        guard orderedViewControllers.count > previousIndex else {
//            return nil
//        }
//
//        return orderedViewControllers[previousIndex]
//    }
//
//    //AFTER
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
//            return nil
//        }
//        let nextIndex = viewControllerIndex + 1
//
//        guard  orderedViewControllers.count != nextIndex else {
//            //return orderedViewControllers.first
//            return nil //(biar ga infinity)
//        }
//
//        guard orderedViewControllers.count > nextIndex else {
//            return nil
//        }
//
//        return orderedViewControllers[nextIndex]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        let pageContentViewController = pageViewController.viewControllers![0]
//        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
//    }
//
//}

