//
//  Checklist.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 19/5/21.
//

import Foundation

/**
 * Wrap steps and mode. It's a simple section of a whole checklist.
 */
struct Checklist {
    var name: String = ""
    var steps = [Step]()
    var mode : Mode = .Unknown
}
