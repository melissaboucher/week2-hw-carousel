//
//  WelcomeViewController.swift
//  carousel
//
//  Created by Melissa on 5/15/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class WelcomeViewController:

UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var carouselButton: UIButton!
    
    @IBOutlet weak var backupSwitch: UISwitch!
    @IBOutlet weak var buttonImageView: UIImageView!
    
    var defaults = NSUserDefaults.standardUserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()

//        pageImages = [UIImage(named: "welcome1")!,
//            UIImage(named: "welcome2")!,
//            UIImage(named: "welcome3")!,
//            UIImage(named: "welcome4")!]
//        
//        let pageCount = pageImages.count
//        
//        for _ in 0..<pageCount {
//            pageViews.append(nil)
//        }
        
        let pagesScrollViewSize = scrollView.frame.size

        scrollView.delegate = self
        scrollView.contentSize = CGSize(width:1280, height:568)
        
        resetLearnMoreSection()
//        for index in 0..<pageCount {
//            loadPage(index)
//        }

    
    }
    
    func resetLearnMoreSection() {
        defaults.setBool(false, forKey: "viewPhoto")
        defaults.setBool(false, forKey: "share")
        defaults.setBool(false, forKey: "swipe")
        defaults.synchronize()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        
        
        if pageControl.currentPage == 3
        {
            self.pageControl.alpha = 0
            UIView.animateWithDuration(0.2, animations: {
                self.buttonImageView.alpha = 1
                self.backupSwitch.alpha = 1
                
            })
            
        }
            
        else {
            self.pageControl.alpha = 1
            UIView.animateWithDuration(0.2, animations:{
                self.buttonImageView.alpha = 0
                self.backupSwitch.alpha = 0
                
            })
        }
    }

    
    
//    func loadPage(page: Int) {
//        if page < 0 || page >= pageImages.count {
//            // If it's outside the range of what you have to display, then do nothing
//            return
//        }
//        
//        // 1
//        if let pageView = pageViews[page] {
//            // Do nothing. The view is already loaded.
//        } else {
//            // 2
//            var frame = scrollView.bounds
//            frame.origin.x = frame.size.width * CGFloat(page)
//            frame.origin.y = 0.0
//            
//            // 3
//            let newPageView = UIImageView(image: pageImages[page])
//            newPageView.contentMode = .ScaleAspectFit
//            newPageView.frame = frame
//            scrollView.addSubview(newPageView)
//            
//            // 4
//            pageViews[page] = newPageView
//        }
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
