//
//  TeamScheduleViewController.swift
//  SlackStatus
//
//  Created by Johann Garces on 4/30/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import UIKit

enum ScheduleViewState {
    case started
    case loading(Team)
    case error(Team, Error)
    case empty(Team)
    case loaded(Team)
    
    func getTeam() -> Team? {
        switch self {
            
        case .empty( let team ):
            return team
        
        case .error(let team, _):
            return team
            
        case .loading( let team ):
            return team
            
        case .loaded( let team ):
            return team
            
        default:
            return nil
        }
    }
}

class TeamScheduleViewController: UIViewController {
    
    var displayState = ScheduleViewState.started {
        didSet {
            
            if case .error(_) = displayState {
                setErrorState()
            }
            
            if case .empty(_) = displayState {
                setEmptyPrompt()
            }
            
            if case .loaded(_) = displayState {
                showTableView()
            }
        }
    }
    
    var teamSchedule: TeamScheduleService?
    
    @IBOutlet weak var blueLoadingView: UIView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startRefresh()
    }
    
    func startRefresh(){
        // Do any additional setup after loading the view.
        guard let activeTeam = TeamManager.getLastUsedTeam() else  {
            return
            //OH NO KICK BACK TO LOGIN
        }
        
        displayState = .loading( activeTeam )
        teamSchedule = TeamScheduleService(WithTeam: activeTeam)
        teamSchedule?.getScheduleItems(WithCompletionHandler: loadScheduledItems)
    }
    
    func loadScheduledItems (_ items: [ScheduleItem]?, _ error: Error?) {
        
        //If there is no team, something started INCORRECTLY
        guard let team = displayState.getTeam() else { return }
        
        if let error = error  {
            displayState = .error(team, error)
            return
        }
        
        if let items = items, items.count > 0 {
            displayState = .loaded(team)
            
        } else { // nil items or no items
            displayState = .empty(team)
        }

    }
    
    private func setErrorState(){
        
    }
    
    private func setEmptyPrompt(){
        
    }
    
    private func showTableView(){
        
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}
