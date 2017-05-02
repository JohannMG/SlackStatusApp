//
//  Days.swift

import Foundation

enum Days : String {
    case monday = "Mon"
    case tuesday = "Tue"
    case wednesday = "Wed"
    case thursday = "Thur"
    case friday = "Fri"
    case saturday = "Sat"
    case sunday = "Sun"
}

extension Days {
    
    func longName() -> String {
        switch self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        case .sunday: 
            return "Sunday"
        }
    }
    
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
    
    static func getCollectionAsString<T: Collection>(_ daysCollection: T ) -> String {
        let days = daysCollection.onlyType(Days.self)
        
        if days.count == 1 { return days.first!.longName() }
        
        return days.sorted().map{ $0.rawValue }.reduce("") { sum, element in
            if sum == "" { return element }
            return "\(sum), \(element)"
        }
    }
    
}

extension Days: Comparable {
    
    func getIntValue() -> Int {
        switch self {
        
        case .monday:
            return 0
        case .tuesday:
            return 1
        case .wednesday:
            return 2
        case .thursday:
            return 3
        case .friday:
            return 4
        case .saturday: 
            return 5
        case .sunday: 
            return 6
        }
    }
    
    static func < (lhs: Days, rhs: Days) -> Bool {
        return lhs.getIntValue() < rhs.getIntValue()
        
    }
    
    static func == (lhs: Days, rhs: Days) -> Bool {
        return lhs.getIntValue() == rhs.getIntValue()
    }
    
}
