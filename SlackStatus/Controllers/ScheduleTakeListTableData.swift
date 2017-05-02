//
//  ScheduleTakeListTableData.swift
//  SlackStatus
//
//  Created by Johann Garces on 5/1/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import UIKit

class ScheduleTaskListTableData: NSObject, UITableViewDataSource {
    
    let cellReuseId = "scheduleItemCell"
    var teamScheduleService: TeamScheduleService
    
    init(WithService teamScheduleService: TeamScheduleService){
        self.teamScheduleService = teamScheduleService
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //A schedule Item
        if indexPath.row < teamScheduleService.scheduleItems.count {
            return getTaskCellForTableView(tableView, cellForRowAt: indexPath)
        }
        
        //The Add Button
        return getAddButton(tableView)
    }
    
    func getTaskCellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! ScheduleItemTableViewCell
        let scheduleItem = teamScheduleService.scheduleItems[indexPath.row]
        cell.timeLabel.text = "\(scheduleItem.hour):\(scheduleItem.minute)"
        cell.daysListLabel.text = Days.getCollectionAsString( scheduleItem.days )
        cell.statusTextLabel.text = "\(scheduleItem.emoji) \(scheduleItem.statusMessage)"
        return cell
    }
    
    func getAddButton(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell") as! AddItemTableViewCell
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? teamScheduleService.scheduleItems.count + 1 : 0
    }
    
    //    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    //
    //    }
    
    //    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
    //
    //    }
    //
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //
    //    }
    //
    //    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    //
    //    }
    
    
}
