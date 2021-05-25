//
//  ChecklistCompleted.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 19/5/21.
//

import Foundation



/* Wrap a group of checklists. Represent a single aircraft model checklist*/
struct ChecklistCompleted : Identifiable {
    var id = UUID()
    var icao = "XXXX"
    var model = ""
    var information = ""
    var checklists = [Checklist]()
    
    var identifier: String {
        get {
            var t : String = "\(icao)/\(model)"
            if(!information.isEmpty){
                t = "\(t)\(information)"
            }
            return t.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        set(value) {
            let fragments = value.components(separatedBy: "/")
            icao = fragments[0]
            if(fragments.count > 1 ) {model = fragments[1]}
            if(fragments.count > 2 ) {information = fragments[2]}
            
            
        }
    }
    
    
}
