//
//  Mode.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 19/5/21.
//

import Foundation
enum Mode : Int {
    case Unknown = 0
    case Normal = 1
    case Info = 2
    case Abnormal = 4
    case Emergency = 8
    case Identifier = 256
}


/*
 Unknown(0),
     Normal(1),
     Info(2),
     Abnormal(4),
     Emergency(8),
     Identifier(256)
 */
