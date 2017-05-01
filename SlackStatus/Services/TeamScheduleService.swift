//
//  TeamScheduleService.swift
//  SlackStatus
//
//  Created by Johann Garces on 4/30/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import Foundation

typealias ScheduleItemRetreivalTask = (_ items: [ScheduleItem]?, _ error: Error?) -> Void

class TeamScheduleService: NSObject {
    
    let team: Team
    private(set) var scheduleItems = [ScheduleItem]()
    
    init(WithTeam team: Team){
        self.team = team
    }
    
    ///////RIGHT NOW THIS IS ALL FAKE DATA OMG 
    
    func getScheduleItems(WithCompletionHandler completion: @escaping ScheduleItemRetreivalTask ){
        //TODO, web request or cache here 
        if scheduleItems.isEmpty { completion(scheduleItems, nil) }
        
        reloadScheduleItems( WithCompletionHandler: completion )
        
    }
    
    func reloadScheduleItems(WithCompletionHandler completion: @escaping ScheduleItemRetreivalTask ){
        scheduleItems.append(
            ScheduleItem(hour: 9, minute: 00, days: Days.getWeekdays(),
                         emoji: "🖥", statusMessage: "In The Office"))
        
        scheduleItems.append(
            ScheduleItem(hour: 5, minute: 40, days: Days.getWeekdays(),
                         emoji: "🏠", statusMessage: "Home"))
        
        scheduleItems.append(
            ScheduleItem(hour: 9, minute: 00, days: Days.wednesday.asSet(),
                         emoji: "💻", statusMessage: "Working From Home"))
        
        ///mock delay for first load 
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(self.scheduleItems, nil)
        }
        
        
    }
    
}
