//
//  ChecklistRowView.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 22/5/21.
//

import SwiftUI

struct ChecklistRowView: View {
    
    @State var instruction : String = "Master switch"
    @State var collation: String = "On, then off for 10 seconds and return on"
    
    var body: some View {
        HStack (alignment: .top) {
            Text(instruction)
                .frame(maxWidth:200, alignment:.leading)
                .padding()
            
            Text("............")
                .frame(alignment:.center)
                .padding()
               
           
            Text(collation)
                .frame(maxWidth:200, alignment:.leading)
                .padding()
            
        }
        .background(Color.gray)
        
    }
}

struct ChecklistRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistRowView()
    }
}
