//
//  Team.swift

import Foundation

class Team: NSObject, NSCoding {
    let id: String
    let name: String
    
    static let teamIdKey = "TeamIdentifierString"
    static let teamNameKey = "TeamNameString"
    
    init (id: String, name: String){
        self.id = id
        self.name = name
    }
    
    required init(coder decoder: NSCoder){
        self.id = decoder.decodeObject(forKey: Team.teamIdKey) as! String
        self.name = decoder.decodeObject(forKey: Team.teamNameKey) as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: Team.teamIdKey)
        aCoder.encode(name, forKey: Team.teamNameKey)
    }
}

//Archiving to Data
extension Team {

    class func archiveTeams(_ teams: [Team]) -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: teams)
    }
    
    class func unarchiveTeamsFromData(_ teamData: Data?) -> [Team]? {
        guard let teamData = teamData else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: teamData) as? [Team]
    }
    
}

//extension Team: Equatable {
//    
//    static func == (lhs: Team, rhs: Team) -> Bool {
//        return lhs.id == rhs.id
//    }
//    
//}

