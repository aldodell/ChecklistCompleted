//
//  ChecklistRowView.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 22/5/21.
//

import SwiftUI

struct StepRowView: View {
    
  //  @State var instruction : String = "Master switch"
  //  @State var collation: String = "On, then off for 10 seconds and return on"
    @State var step : Step
    
    var body: some View {
        HStack (alignment: .top) {
            Text(step.instruction)
                .frame(maxWidth:200, alignment:.leading)
                .padding()
            
            Text("............")
                .frame(alignment:.center)
                .padding()
               
           
            Text(step.collation)
                .frame(maxWidth:200, alignment:.leading)
                .padding()
            
        }
        .background(Color.gray)
        
    }
}

struct StepRowView_Previews: PreviewProvider {
    static var previews: some View {
        StepRowView(step: Step(instruction: "abc", collation: "def"))
    }
}
