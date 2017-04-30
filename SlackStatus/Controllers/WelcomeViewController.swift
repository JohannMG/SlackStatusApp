//
//  WelcomeViewController.swift
//  SlackStatus
//
//  Created by Johann Garces on 4/30/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import UIKit

class WelcomeViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        let loginController = OAuthWebViewViewController()
        loginController.loginDelegate = self
        
        present(loginController, animated: true) { 
            sender.isUserInteractionEnabled = true
        }
    }
    
    

}

extension WelcomeViewController: OAuthSlackLoginDelegate {
    
    func loginDidSucceed(){
        let scheduleViewController = self.storyboard?.instantiateViewController(withIdentifier: "TeamScheduleViewController")
        
        if let scheduleViewController = scheduleViewController as? TeamScheduleViewController {
            present(scheduleViewController, animated: true, completion: nil)
        }
    }
    
    func loginFailOrDidDismiss(){
        
    }
    
}
