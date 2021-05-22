//
//  ChecklistView.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 21/5/21.
//

import SwiftUI


struct MyButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth:.infinity, minHeight: 32)
            .foregroundColor(Color.white)
    }
    
}





struct ChecklistView: View {
    var body: some View {
        VStack{
            Text("C172")
            
            HStack  {
                Button("EMERGENCY"){}
                    .body.background(Color.red)
                    .buttonStyle(MyButtonStyle())
                    
            
                Button("ABNORNAL"){}
                    .body.background(Color.yellow)
                    .buttonStyle(MyButtonStyle())
            }
           Spacer()
            
            HStack {
                Button("NORMAL"){}
                    .body.background(Color.green).buttonStyle(MyButtonStyle())
                Button("INFO"){}
                    .body.background(Color.blue)
                    .buttonStyle(MyButtonStyle())
            }
            
            List() {}
            
        }
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
