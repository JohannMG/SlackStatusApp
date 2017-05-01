//
//  Days.swift

import Foundation

enum Days {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
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
}
