//
//  SignInViewController.swift
//  carousel
//
//  Created by Melissa on 5/11/15.
//  Copyright (c) 2015 Melissa Boucher. All rights reserved.
//

import UIKit

let buttonsLowerFrame = CGRect(x: 0, y: 425, width:320, height: 104)
let buttonsHigherFrame = CGRect(x: 0, y: 240, width:320, height: 104)
let loginFormLinesLowerFrame = CGRect(x: 0, y:158, width:320, height:113)
let loginFormLinesHigherFrame = CGRect(x: 0, y:78, width:320, height:113)
let emailLowerFrame = CGRect(x: 25, y: 172, width:277, height:42)
let emailHigherFrame = CGRect(x: 25, y: 92, width:277, height:42)
let passwordLowerFrame = CGRect(x: 25, y: 216, width:277, height:42)
let passwordHigherFrame = CGRect(x: 25, y: 136, width:277, height:42)
let buttonPressLowerFrame = CGRect(x: 20, y: 439, width: 282, height: 46)
let buttonPressHigherFrame = CGRect(x: 20, y: 254, width: 282, height: 46)


class SignInViewController: UIViewController, UIAlertViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var signInButtonsView: UIImageView!
    @IBOutlet weak var loginFormLinesFrame: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var carouselDescriptionView: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    
    var keyboardDismissTapGesture: UIGestureRecognizer?
    
    var correctEmail = "e"
    var correctPassword = "p"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set initial positions
        setInitialPositions()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

    }

    func dismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackArrow(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        moveElementsToHigherPositions()
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        returnToOriginalPositions()
    }
    

    @IBAction func onViewTap(sender: AnyObject) {
        println("tapped view")
        dismissKeyboard()
    }

    func alertForEmptyFields() {
        println("checking for empty fields")
        if emailTextField.text.isEmpty {
            var alert = UIAlertView(title: "Email required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "Ok")
            alert.show()
        }
        else if passwordTextField.text.isEmpty {
            var alert = UIAlertView(title: "Password required", message: "Please enter your password", delegate: self, cancelButtonTitle: "Ok")
            alert.show()
            
        }
    }
    
    @IBAction func onSignInButtonPress(sender: AnyObject) {
        println("pressed button")
        self.dismissKeyboard()

        
        //Check if any fields empty
        if emailTextField.text.isEmpty || passwordTextField.text.isEmpty {
            
            delay(0.5) {
                self.alertForEmptyFields()
            }

            

        }
        else {
     
            println("signing in")
            
            var signingInAlert = UIAlertView()
            signingInAlert.message = "Signing in..."
            delay(0.5) {
            signingInAlert.show()
            }
//            var alertController = UIAlertController(title: "Signing in...", message: "", preferredStyle: .Alert)
//            self.presentViewController(alertController, animated: true, completion: nil)
            
            delay(2.0) {
                if self.emailTextField.text == self.correctEmail && self.passwordTextField.text == self.correctPassword {
                    println("email & password correct")

                    signingInAlert.dismissWithClickedButtonIndex(0, animated: true)
                    
                    self.performSegueWithIdentifier("loggedInSegue", sender: self)
                    

                    
                    
                } else {
                    
                    var alert = UIAlertView(title: "Login failed", message: "Incorrect email or password.", delegate: self, cancelButtonTitle: "Ok")
                    self.dismissKeyboard()
                        alert.show()}
                    
                    signingInAlert.dismissWithClickedButtonIndex(0, animated: true)
                
            }
            
        }

        

        
    }
    
    
    func setInitialPositions() {
        carouselDescriptionView.alpha = 1
        self.signInButtonsView.frame = buttonsLowerFrame
        self.loginFormLinesFrame.frame = loginFormLinesLowerFrame
        self.emailTextField.frame = emailLowerFrame
        self.passwordTextField.frame = passwordLowerFrame
        self.signInButton.frame = buttonPressLowerFrame

    }
    
    func returnToOriginalPositions() {
        carouselDescriptionView.alpha = 1
        
        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .CalculationModeCubic, animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.4) {
                self.signInButtonsView.frame = buttonsLowerFrame
                self.loginFormLinesFrame.frame = loginFormLinesLowerFrame
                self.emailTextField.frame = emailLowerFrame
                self.passwordTextField.frame = passwordLowerFrame
                self.signInButton.frame = buttonPressLowerFrame
            }
            }, completion: nil)
        

    }
    
    func moveElementsToHigherPositions() {
        
        carouselDescriptionView.alpha = 0

        UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .CalculationModeCubic, animations: {
            
            UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.4) {
                self.signInButtonsView.frame = buttonsHigherFrame
                self.loginFormLinesFrame.frame = loginFormLinesHigherFrame
                self.emailTextField.frame = emailHigherFrame
                self.passwordTextField.frame = passwordHigherFrame
                self.signInButton.frame = buttonPressHigherFrame

            }
            }, completion: nil)
        
    }
    
    
    //    func dismissAlertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
    //        //        alertView.dismissWithClickedButtonIndex(buttonIndex: Int, animated: <#Bool#>)
    //        alertView.dismissWithClickedButtonIndex(0, animated: true)
    //
    //        println("tapped")
    //    }
    
    //    @IBAction func touchedEmailField(sender: AnyObject) {
    //        moveElementsToHigherPositions()
    //    }
    //
    //    @IBAction func touchedPasswordField(sender: AnyObject) {
    //        moveElementsToHigherPositions()
    //    }
    //
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
