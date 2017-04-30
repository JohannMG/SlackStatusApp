//
//  Team.swift

import Foundation

class Team: NSCoding {
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

