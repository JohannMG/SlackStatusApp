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
            
            if case .loading(_) = displayState {
                setLoadingState()
            }
            
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
    
    @IBOutlet weak var tableView: UITableView!
    var loadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startRefresh()
        setupTable()
    }
    
    func setupTable(){
//        tableView.register(ScheduleItemTableViewCell, forCellReuseIdentifier: "scheduleItemCell")
    }
    
    func startRefresh(){
        
        tableView.isHidden = true
        
        // Do any additional setup after loading the view.
        guard let activeTeam = TeamManager.getLastUsedTeam() else  {
            print("NO DEFAULT TEAM")
            return
            //OH NO KICK BACK TO LOGIN
        }
        
        navigationController?.navigationBar.isHidden = true
        
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
    
    private func setLoadingState(){
        tableView.isHidden = true
        if loadingView.superview == nil {
            view.addSubview(loadingView)
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loadingView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            loadingView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }
    }
    
    private func setErrorState(){
        
    }
    
    private func setEmptyPrompt(){
        
    }
    
    private func showTableView(){
        print(#function)
        guard let teamSchedule = teamSchedule else {
            print("NO TEAM SCHEDULE")
            return
        }
        
        UIView.animate(withDuration: 0.2) { 
            self.loadingView.alpha = 0
            
        }
        tableView.isHidden = false
        navigationController?.navigationBar.isHidden = false
        tableView.dataSource = ScheduleTakeListTableData(WithService: teamSchedule)
        tableView.reloadData()
    }

}







