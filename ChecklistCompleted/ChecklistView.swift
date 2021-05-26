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
    
    @ObservedObject var dataShared : DataShared
    @State var checklistCompleted : ChecklistCompleted
    @State var mode : Mode = Mode.Normal
    var checklist : Checklist? = nil
    
    var body: some View {
        VStack{
            Text(dataShared.selectedAircraft)
            
            HStack  {
                Button("EMERGENCY"){mode = .Emergency}
                    .body.background(Color.red)
                    .buttonStyle(MyButtonStyle())
                
                Button("ABNORNAL"){mode = .Abnormal}
                    .body.background(Color.yellow)
                    .buttonStyle(MyButtonStyle())
            }
            Spacer()
            
            HStack {
                Button("NORMAL"){mode = .Normal}
                    .body.background(Color.green).buttonStyle(MyButtonStyle())
                Button("INFO"){mode = .Info}
                    .body.background(Color.blue)
                    .buttonStyle(MyButtonStyle())
            }
            
            if(checklist == nil) {
                let checklists = checklistCompleted.checklists.filter {$0.mode == mode }
                List(checklists) {
                    cl in
                    ChecklistRowView(dataShared: dataShared, checklist: cl)
                }
            } else {
                List(checklist!.steps) {
                    step in
                    StepRowView(step: step)
                    
                }
                
            }
            
            
            Spacer()
            
            HStack {
                Button("<") {}
                    .padding()
                
                Spacer()
                Button("Done"){}
                    .padding()
                
                Spacer()
                Button(">")
                    {}
                    .padding()
                
                
            }
            
            
        }
        .onAppear {
            let icao = dataShared.selectedAircraft.components(separatedBy: "/")[0]
            let path =  Bundle.main.path(forResource: icao, ofType: "checklist")
            let proc = ChecklistProcessor()
            let checklists = proc.parse(path: path!)
            checklistCompleted  = checklists.first(where: {$0.identifier == dataShared.selectedAircraft})!
        }
        
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView(dataShared: DataShared(), checklistCompleted: ChecklistCompleted())
    }
}
