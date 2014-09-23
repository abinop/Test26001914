//
//  ViewController.swift
//  Test26001914
//
//  Created by Administrator on 23/9/14.
//  Copyright (c) 2014 TopCreations. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var page_text : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override  func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func b_hide_keyboard(sender: AnyObject) {
        self.page_text.resignFirstResponder()
    }
    
    func keyboardWillShow(notification:NSNotification){
      
        
        self.page_text.frame = CGRectMake(self.page_text.frame.origin.x, self.page_text.frame.origin.y, self.page_text.frame.width, (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().origin.y - 180)
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.page_text.frame = CGRectMake(self.page_text.frame.origin.x, self.page_text.frame.origin.y, self.page_text.frame.width, (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().origin.y + 180)
    }
    


}

