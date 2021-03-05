//
//  ViewController.swift
//  BT x.x - Config 3 -
//

import AVKit
import UIKit
import AWSAuthCore
import AWSAuthUI
import AWSS3
import AWSCore

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSignIn()
    }
    func showSignIn() {
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(with:
                self.navigationController!,configuration: nil,
                completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                       if error != nil {
                          print("Error occurred: \(String(describing: error))")
                       } else {
                          // Sign in successful.
                       }
            })
        }
    }
    @IBAction func LogoutBtnPressed(_ sender: Any) {
        print ("Logout Pressed")
        AWSSignInManager.sharedInstance().logout(completionHandler: {(result: Any?, error: Error?) in
            self.showSignIn()
            print ("Logout Successful")
        })
    } 
}

