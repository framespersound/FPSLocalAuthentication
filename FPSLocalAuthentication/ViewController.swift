//
//  ViewController.swift
//  FPSLocalAuthentication
//
//  Created by echolush on 7/17/14.
//  Copyright (c) 2014 Matt Ozer. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
                            
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnProtectedArea(sender: UIButton) {
        var myContext = LAContext()
        var authenticationReason = "Protected Access"
        var error: NSError?
        if myContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            myContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: authenticationReason, reply: { (success: Bool, err: NSError?) in
                if success {
                    println("Authentication is successfull")
                    var pvc: ProtectedViewController = self.storyboard.instantiateViewControllerWithIdentifier("ProtectedViewController") as ProtectedViewController
                    self.presentViewController(pvc, animated: true, completion: nil)
                }
                })
        }
    }

}

