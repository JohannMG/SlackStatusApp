//
//  TeamManager.swift
//  SlackStatus
//
//  Created by Johann Garces on 4/30/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import Foundation




/*
 Managers mutiple login for teams
    - Update team name to display
    - Team last active (for app restart)
    - All logged-in team ids
    - Login Saving
    - Logging Out
    - Get API key from keychain from team id
 
 */

struct TeamKeys{
    static let allTeamsKey = "teams.allteams"
}

class TeamManager {
    
    static func loggedInWithTeam(_ team: Team, AndApiTokenForTeam: String){
        
    }
    
    static func addTeam(_ team: Team) {
        var allTeams = TeamManager.getAllTeams() ?? [Team]()
        allTeams.append(team)
        saveUpdateTeamsList(allTeams)
    }
    
    static func saveUpdateTeamsList(_ team: [Team]){
        UserDefaults.standard.set(team, forKey: TeamKeys.allTeamsKey)
    }
    
    static func getAllTeams() -> [Team]? {
        return UserDefaults.standard.array(forKey: TeamKeys.allTeamsKey) as? [Team]
    }
    
    
    
}
