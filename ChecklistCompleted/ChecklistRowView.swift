//
//  ChecklistRowView.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 22/5/21.
//

import SwiftUI

struct ChecklistRowView: View {
    
    @State var statement : String
    @State var instruction: String
    
    var body: some View {
        HStack (alignment: .top) {
            Text("Master switch")
                .frame(maxWidth:200, alignment:.leading)
                .padding()
            
            Text("............")
                .frame(alignment:.center)
                .padding()
               
           
            Text("On, then off for 10 seconds and return on")
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
