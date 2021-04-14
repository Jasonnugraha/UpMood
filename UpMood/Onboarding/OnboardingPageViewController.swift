//
//  OnboardingPageViewController.swift
//  UpMood
//
//  Created by DHIKA ADITYA ARE on 08/04/21.
//

import UIKit

protocol OnboardingParentProtocol: class {
    func getParentPageViewController(parentRef: OnboardingPageViewController)
}

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var emotionEmoji: String!
    var emotionDescription: String!
    var reasons: [Labels]!
    var notes: String?
    
    var causeOfFeelingEmojiArray :[String] = []
    var causeOfFeelingDescArray :[String] = []

    lazy var orderedViewControllers: [UIViewController] = {
        
        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
        let vc1 = sb.instantiateViewController(identifier: "onBoardingFirst")
        let vc2 = sb.instantiateViewController(identifier: "onBoardingSecond")
        let vc3 = sb.instantiateViewController(identifier: "onBoardingThird")
        let vc4 = sb.instantiateViewController(identifier: "onBoardingFourth")
        
        // Parent Delegate Child
        let vc1withParent = vc1 as! OnboardingParentProtocol
        vc1withParent.getParentPageViewController(parentRef: self)
        
        let vc2withParent = vc2 as! OnboardingParentProtocol
        vc2withParent.getParentPageViewController(parentRef: self)
        let vc3withParent = vc3 as! OnboardingParentProtocol
        vc3withParent.getParentPageViewController(parentRef: self)
        let vc4withParent = vc4 as! OnboardingParentProtocol
        vc4withParent.getParentPageViewController(parentRef: self)
        
        var viewControllers = [UIViewController]()
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)

        return viewControllers
    }()
    
    // Check number of pages
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Page content
        self.dataSource = self;
        // Set the content (VCs) to be displayed, which is the first page
        let firstViewController = orderedViewControllers[0]
        setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        // Page behaviour
        self.delegate = self
        configurePageControl()
    }
    

    //fungsi cek jumlah page 1.1
    func configurePageControl(){
        // Size of page control
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        // Number of Pages
        pageControl.numberOfPages = orderedViewControllers.count
        // Set the current initial page to be the first or index 0 page
        pageControl.currentPage = 0
        // Styling of page
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    
    // Returns the PREVIOUS View Controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard  previousIndex >= 0 else {
            //return orderedViewControllers.last
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    // Returns the NEXT View Controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        
        guard  orderedViewControllers.count != nextIndex else {
            //return orderedViewControllers.first
            return nil //(biar ga infinity)
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
                
        return orderedViewControllers[nextIndex]
    }
    //go to next page
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
            if let currentViewController = viewControllers?[0] {
                if let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) {
                    setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
                }
            }
        }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!

        print("pageControl", self.pageControl.currentPage)
        if (self.pageControl.currentPage == 3) {
            
        }
//        print("Current VC :", pageContentViewController)
//        print("Prev VC :", previousViewControllers[0])
//        print("Finished :", finished)
//        print("Completed :",completed)
        
    }
    
    func setDataSourceSelf() {
        self.dataSource = self
//        self.delegate = self
    }
    
    func setDataSourceNil() {
        self.dataSource = nil
//        self.delegate = nil
    }
    
    func setFeeling(_emotionValue: Int, _emotionEmoji: String, _emotionDescription: String) {
//        print("value", _emotionValue)
//        print("emoji", _emotionEmoji)
//        print("desc", _emotionDescription)
        emotionEmoji = _emotionEmoji
        emotionDescription = _emotionDescription
    }
    
    func setReasons(_sender: [Labels]) {
        reasons = _sender
        print("reasons di parent :", _sender)
        for item in reasons {
            if (item.isChecked){
                causeOfFeelingDescArray.append(item.reason)
                causeOfFeelingEmojiArray.append(item.emojiLogo)
            }
        }
    }
    
    func setNotes(_sender: String) {
        notes = _sender
        print(notes)
    }
    let contexts = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func saveCurhat(){
        
        let curhatToSave = Curhat(context: self.contexts)
        curhatToSave.emoji = emotionEmoji
        curhatToSave.date = Date()
        curhatToSave.desc = notes
        curhatToSave.feeling = emotionDescription
        curhatToSave.causeOfFeelingDesc = causeOfFeelingDescArray
        curhatToSave.causeOfFeelingEmoji = causeOfFeelingEmojiArray
        
        do {
            try contexts.save()
        } catch  {
            
        }
    }
}
