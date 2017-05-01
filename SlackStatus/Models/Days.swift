//
//  Days.swift

import Foundation

enum Days : String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

extension Days {
    static func getWeekdays() -> Set<Days> {
        return Set([.monday, .tuesday, .wednesday, .thursday, .friday])
    }
    
    static func getWeekends() -> Set<Days> {
        return Set([.saturday, .sunday])
    }
    
    static func getAllDays() -> Set<Days> {
        return getWeekdays().union( getWeekends() )
    }
    
    func asSet() -> Set<Days>{
        return Set<Days>([self])
    }
    
    static func getCollectionAsString<T: Collection>(_ days: T ) -> String {
        return days.filter{ $0 is Days }.map{ ($0 as! Days).rawValue }.reduce("") { sum, element in
            if sum == "" { return element }
            return ", \(element)"
            
        }
    }
    
}
