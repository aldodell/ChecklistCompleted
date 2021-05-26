//
//  AircraftRow.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 19/5/21.
//

import SwiftUI

struct AircraftRow  : View {
    var name : String = ""
    @ObservedObject var dataShared : DataShared
    
    
    var body : some View {
        Button(name) {
            dataShared.selectedAircraft = name
            UserDefaults.standard.setValue(name, forKey: "selectedAircraft")
            UserDefaults.standard.synchronize()
                
        }.padding()
        
    }
    

}


