//
//  ChecklistRowView.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 25/5/21.
//

import SwiftUI

struct ChecklistRowView: View {
    @State var dataShared : DataShared
    var checklist: Checklist
    var body: some View {
        NavigationLink (destination: ChecklistView(dataShared: dataShared, checklistCompleted: ChecklistCompleted(), checklist: checklist)) {
            Text(checklist.name)
        }
    }
}

struct ChecklistRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistRowView(dataShared: DataShared(), checklist: Checklist())
    }
}
