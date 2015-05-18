//
//  PhotoViewController.swift
//  carousel
//
//  Created by Melissa on 5/17/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let defaults = NSUserDefaults.standardUserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width:960, height:568)
        scrollView.delegate = self
        defaults.setBool(true, forKey: "viewPhoto")
        println("viewed photo")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("scrolled!")
        defaults.setBool(true, forKey: "swipe")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressBackArrow1(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressBackArrow2(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressBackArrow3(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressShareButton(sender: AnyObject) {
        
        defaults.setBool(true, forKey: "share")
        
        let optionMenu = UIAlertController(title: nil, message: "Share with", preferredStyle: .ActionSheet)
        
        let messagesAction = UIAlertAction(title: "Messages", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Messaged")
            self.performSegueWithIdentifier("messageSegue", sender:self)
        })
        
        let emailAction = UIAlertAction(title: "Email", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Emailed")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Cancelled")
        })
        
        optionMenu.addAction(messagesAction)
        optionMenu.addAction(emailAction)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)

    }
    
   func showActionSheet(sender:AnyObject) {
        let optionMenu = UIAlertController(title: nil, message: "Share with", preferredStyle: .ActionSheet)
        
        let messagesAction = UIAlertAction(title: "Messages", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Messaged")
        })
        
        let emailAction = UIAlertAction(title: "Email", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Emailed")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Cancelled")
        })
        
        optionMenu.addAction(messagesAction)
        optionMenu.addAction(emailAction)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)

        
        

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
