//
//  CreateViewController.swift
//  carousel
//
//  Created by Melissa on 5/16/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var fieldsGroupView: UIView!
    @IBOutlet weak var buttonsGroupView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }

    @IBAction func onTap(sender: AnyObject) {
        dismissKeyboard()
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        fieldsGroupView.frame.origin.y = -20
        buttonsGroupView.center.y = 318
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldsGroupView.frame.origin.y = 75
        buttonsGroupView.center.y = 439
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCheckbox(sender: UIButton) {
        if(sender.selected == false) {
            sender.selected = true
        }
        else {
            sender.selected = false
        }
    }
    
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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
