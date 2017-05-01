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
    static let lastKey = "teams.lastUsed"
}

typealias ApiToken = String

class TeamManager {
    
    static func loggedInWithTeam(_ team: Team, AndApiTokenForTeam teamApiToken: String){
        KeychainWrapper.standard.set(teamApiToken, forKey: team.id)
        addTeam(team)
        
        //Sets the last team to the one just logged in
        setLastUsedTeam(team)
    }
    
    static func logoutTeam(_ team: Team){
        KeychainWrapper.standard.removeObject(forKey: team.id)
    }
    
    static func removeTeam(_ teamToDiscard: Team){
        guard let teams = getAllTeams() else {
            return //there were no teams for some reason. oh no!
        }
        saveUpdatedTeamsList( teams.filter{ $0 != teamToDiscard } )
    }
    
    static func addTeam(_ team: Team) {
        var allTeams = TeamManager.getAllTeams() ?? [Team]()
        allTeams.append(team)
        saveUpdatedTeamsList(allTeams)
    }
    
    //SAVE TO USER DEFAULTS
    static func saveUpdatedTeamsList(_ team: [Team]){
        UserDefaults.standard.set( Team.archiveTeams(team) , forKey: TeamKeys.allTeamsKey)
        UserDefaults.standard.synchronize()
    }
    
    //READ FROM USER DEFAULTS
    static func getAllTeams() -> [Team]? {
        return Team.unarchiveTeamsFromData( UserDefaults.standard.data(forKey: TeamKeys.allTeamsKey) )
    }
    
    static func getApiTokenForTeam(_ team: Team) -> ApiToken? {
        return KeychainWrapper.standard.string(forKey: team.id)
    }
    
    static func setLastUsedTeam(_ team: Team){
        UserDefaults.standard.set(team.id, forKey: TeamKeys.lastKey)
    }
    
    static func getLastUsedTeam() -> Team? {
        let lastUserTeamId = UserDefaults.standard.string(forKey: TeamKeys.lastKey)
        return getAllTeams()?.filter{ $0.id == lastUserTeamId }.first
    }
    
}






