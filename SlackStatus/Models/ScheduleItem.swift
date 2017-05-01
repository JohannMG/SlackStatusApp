//  ScheduleItem.swift

import Foundation

struct ScheduleItem {
    let hour: Int
    let minute: Int
    let days: Set<Days>
    let emoji: String
    let statusMessage: String
}
