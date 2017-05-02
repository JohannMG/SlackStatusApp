//
//  ScheduleItemTableViewCell.swift
//  SlackStatus
//
//  Created by Johann Garces on 4/30/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import UIKit

class ScheduleItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorBoundingView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var daysListLabel: UILabel!
    @IBOutlet weak var statusTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = UIColor.clear
        colorBoundingView.layer.cornerRadius = 6.0
        setGradient()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setGradient()
        colorBoundingView.alpha = 1

        // Configure the view for the selected state
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        setGradient()
        colorBoundingView.alpha = 1
        
    }
    
    private func setGradient(){
        colorBoundingView.backgroundColor = kAppColors.deepBlue
    }

}
