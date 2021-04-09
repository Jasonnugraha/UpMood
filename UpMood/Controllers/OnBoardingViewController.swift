//
//  OnBoardingViewController.swift
//  pages
//
//  Created by DHIKA ADITYA ARE on 09/04/21.
//

import UIKit

class OnBoardingViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var currentPageIndex:Int = 0
    var pageviewcontroller:UIPageViewController!
    //let picker = UIImagePickerController()
    //var imagepicked:UIImage!

    var ViewControllers: [UIViewController] = []
    

    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //picker.delegate = self
        self.pageviewcontroller = (self.storyboard?.instantiateViewController(withIdentifier: "PageViewControllerOnBoarding") as! UIPageViewController)
        self.pageviewcontroller.dataSource = self
        self.pageviewcontroller.delegate = self

        ViewControllers.append(
                    UIStoryboard(name: "Onboarding", bundle: nil) .
                        instantiateViewController(withIdentifier: "onFirst"))
                
        ViewControllers.append(
                    UIStoryboard(name: "Onboarding", bundle: nil) .
                        instantiateViewController(withIdentifier: "onSecond"))
        
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

        self.configurePageControl()
        //configurePageControl()
        
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
    

  /*
    func newVc(viewController: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
 */
    
    
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageviewcontroller.viewControllers![0]
        self.pageControl.currentPage = ViewControllers.firstIndex(of: pageContentViewController)!
    }
 
}
