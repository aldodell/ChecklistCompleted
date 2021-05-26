//
//  AircraftSelectorView.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 17/5/21.
//

import SwiftUI

struct AircraftSelectorView : View {
    @State var finding : String = ""
    @ObservedObject var dataShared : DataShared
    var checklistCompletedList : [ChecklistCompleted] = []
    var selectedAircraft = ""
    
    init (_ ds : DataShared){
        dataShared = ds
        
        let paths = Bundle.main.paths(forResourcesOfType: "checklist", inDirectory: nil)
        let proc = ChecklistProcessor()
        
        for path in paths {
            let results = proc.parseIdentifier(path: path)
            for result in results {
                var cl = ChecklistCompleted()
                cl.identifier = result
                checklistCompletedList.append(cl)
            }
        }
        
        
        checklistCompletedList.sort(by: {$0.identifier < $1.identifier})
    }
    
    
    
    var body: some View {
        
        
        VStack() {
            HStack() {
                Image(systemName: "magnifyingglass").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                TextField("Search", text: $finding)
            }
            .padding()
            Spacer()
            List(checklistCompletedList) { checklistCompleted in
                AircraftRow(name: checklistCompleted.identifier, dataShared: dataShared)
            }
            Spacer()
            Text("Selected: \(dataShared.selectedAircraft)")
        }
        
    }
    
}


struct AircraftSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        AircraftSelectorView(DataShared())
    }
}
