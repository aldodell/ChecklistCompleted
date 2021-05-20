//
//  Step.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 19/5/21.
//

import Foundation

/** Each single instruction of a checklist */
struct Step {
    var instruction: String = ""
    var collation: String = ""
    var isTabuled: Bool = false

    //Usado por el visor, para decir que ya fue visto este paso
    var isDone:Bool = false

}
