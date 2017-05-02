//
//  SchedulingNavigationController.swift
//  SlackStatus
//
//  Created by Johann Garces on 5/1/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import UIKit

class SchedulingNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationBar.barTintColor = kAppColors.brightBlue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
