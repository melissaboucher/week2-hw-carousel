//
//  FeedViewController.swift
//  carousel
//
//  Created by Melissa on 5/15/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bannerView: UIImageView!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var bannerButton: UIButton!
    let defaults = NSUserDefaults.standardUserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.frame = CGRect(x: 0, y: 103, width: 320, height: 429)
        scrollView.contentSize = CGSize(width:320, height:1564)
        bannerView.alpha = 1
        xButton.alpha = 1
        bannerButton.enabled = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //check whether these boxes should be checked!
        if defaults.boolForKey("viewPhoto") && defaults.boolForKey("swipe") && defaults.boolForKey("share") {
            dismissBanner()
        }

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressXButton(sender: AnyObject) {
        dismissBanner()

    }
    
    func dismissBanner() {
        UIView.animateWithDuration(0.5) {
            self.bannerView.alpha = 0
            self.xButton.alpha = 0
            self.bannerButton.enabled = false
            self.scrollView.frame = CGRect(x: 0, y: 62, width: 320, height: 470)
            
        }
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
