//
//  LoadingView.swift
//  SlackStatus
//
//  Created by Johann Garces on 4/30/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    let loadingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        
        backgroundColor = kAppColors.brightBlue
        addSubview(loadingLabel)
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.textAlignment = .center
        
        loadingLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loadingLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        loadingLabel.textColor = UIColor.white
        loadingLabel.text = "Loading..."
        
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
