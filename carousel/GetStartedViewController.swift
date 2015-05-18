//
//  GetStartedViewController.swift
//  carousel
//
//  Created by Melissa on 5/17/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    
    let defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var viewPhotoCheck: UIButton!
    @IBOutlet weak var swipeCheck: UIButton!
    @IBOutlet weak var sharePhotoCheck: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewPhotoCheck.selected = false
        swipeCheck.selected = false
        sharePhotoCheck.selected = false

        
        setCheckboxes()
        
    }

    func setCheckboxes() {
        if defaults.boolForKey("viewPhoto") {
            println("checking checkbox for view photo")
            viewPhotoCheck.selected = true
        }
        
        if defaults.boolForKey("swipe") {
            swipeCheck.selected = true
        }
        
        if defaults.boolForKey("share") {
            sharePhotoCheck.selected = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressXButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
