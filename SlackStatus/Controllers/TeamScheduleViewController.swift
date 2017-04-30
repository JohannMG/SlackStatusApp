//
//  TeamScheduleViewController.swift
//  SlackStatus
//
//  Created by Johann Garces on 4/30/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import UIKit

enum ScheduleViewState {
    case loading
    case noConnection
    case error
    case empty(Team)
    case loaded(Team)
}

class TeamScheduleViewController: UIViewController {
    
    var displayState = ScheduleViewState.loading

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
