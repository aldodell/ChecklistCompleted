//
//  AircraftSelectorView.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 17/5/21.
//

import SwiftUI

struct AircraftSelectorView : View {
    
    @State var value : String = ""
    var list = ["a","b","c"]
    
    
    var body: some View {
        
        VStack() {
            HStack() {
                Image(systemName: "magnifyingglass").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                TextField("Search", text: $value)
            }
            .padding()
            Spacer()
            List() {}
        }
        
    }
    
}


struct AircraftSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        AircraftSelectorView()
        
       
        
        
    }
}
