//
//  Collection.swift
//  SlackStatus
//
//  Created by Johann Garces on 5/1/17.
//  Copyright © 2017 johannmg. All rights reserved.
//

import Foundation


extension Collection {
    
    func onlyType<T>(_ type: T.Type) -> [T] {
        return self.filter{ $0 is T }.map{ $0 as! T }
    }
    
}
