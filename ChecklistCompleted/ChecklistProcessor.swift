//
//  ChecklistProcessor.swift
//  ChecklistCompleted
//
//  Created by Aldo Dell Uomini on 20/5/21.
//

import Foundation

/*
 extension StringProtocol {
 subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
 subscript(range: Range<Int>) -> SubSequence {
 let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
 return self[startIndex..<index(startIndex, offsetBy: range.count)]
 }
 subscript(range: ClosedRange<Int>) -> SubSequence {
 let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
 return self[startIndex..<index(startIndex, offsetBy: range.count)]
 }
 subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
 subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
 subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
 }
 */

class ChecklistProcessor
{
    
    let tags :  [Character: Character] = [
        "[":"]",
        "{":"}",
        "<":">",
        "(":")",
        "#":"#",
        "-":"-"
    ]
    
    
    func parseIdentifier(path : String) -> Array<String> {
        
        let code = try! String.init(contentsOfFile: path)
        
        var result = Array<String>()
        
        //Dividimos el c'odigo en líneas
        for  line in code.split(whereSeparator: \.isNewline) {
            //tomamos el primer caracter
            let openTag = line.first
            
            //Si el primer caracter está contenido en nuestro diccionario entonces proesamos
            if(openTag == "#") {
                let openTagPos = line.index(line.firstIndex(of: "#")!, offsetBy: 1)
                let endTagPos = line.lastIndex(of: "#")!
                let data = String(line[openTagPos..<endTagPos])
                result.append(data)
            }
            
        }
        return result
    }
    
    
    func parse(path : String) -> Array<ChecklistCompleted> {
        
        var result = [ChecklistCompleted]()
        let code = try! String.init(contentsOfFile: path)
        
        var checklistCompleted : ChecklistCompleted? = nil
        var checklist : Checklist? = nil
        var step : Step? = nil
        var data = ""
        
        //Dividimos el c'odigo en líneas
        for  line in code.split(whereSeparator: \.isNewline) {
            
            if(!line.isEmpty) {
                
                //tomamos el primer caracter
                let openTag = line.first
                
                //Si el primer caracter está contenido en nuestro diccionario entonces proesamos
                if(tags.keys.contains(openTag!)) {
                    let openTagPos = line.index(line.firstIndex(of: openTag!)!, offsetBy: 1)
                    let endTagPos = line.lastIndex(of: tags[openTag!]!)
                    if(endTagPos == nil || endTagPos! < openTagPos) {
                        data = String(line.dropFirst())
                    } else {
                        data = String(line[openTagPos..<endTagPos!])
                    }
                } else {
                    data = String(line)
                }
                
                
                
                switch openTag {
                
                case "#":
                    
                    if(checklistCompleted != nil) {
                        result.append(checklistCompleted!)
                    }
                    checklistCompleted = ChecklistCompleted()
                    checklistCompleted!.identifier = data
                    
                    
                case "[":
                    if(checklist != nil) {
                        checklistCompleted?.checklists.append(checklist!)
                    }
                    checklist = Checklist()
                    checklist!.name = data
                    checklist!.mode = Mode.Normal
                    
                    
                case "{":
                    if(checklist != nil) {
                        checklistCompleted?.checklists.append(checklist!)
                    }
                    
                    checklist = Checklist()
                    checklist!.name = data
                    checklist!.mode = Mode.Emergency
                    
                    
                case "(":
                    if(checklist != nil) {
                        checklistCompleted?.checklists.append(checklist!)
                    }
                    checklist = Checklist()
                    checklist!.name = data
                    checklist!.mode = Mode.Info
                    
                    
                case "<":
                    if(checklist != nil) {
                        checklistCompleted?.checklists.append(checklist!)
                    }
                    checklist = Checklist()
                    checklist!.name = data
                    checklist!.mode = Mode.Abnormal
                    
                    
                    
                case "-":
                    let fragments = data.components(separatedBy: "...")
                    step = Step()
                    step?.instruction = fragments[0]
                    if(fragments.count>1) {
                        step?.collation = fragments[1]
                    }
                    step!.isTabuled = true
                    checklist?.steps.append(step!)
                    
                    
                default:
                    let fragments = data.components(separatedBy: "...")
                    step = Step()
                    step?.instruction = fragments[0]
                    if(fragments.count>1) {
                        step?.collation = fragments[1]
                    }
                    step!.isTabuled = false
                    checklist?.steps.append(step!)
                }
                
                
            }
        }
        
        
        checklistCompleted?.checklists.append(checklist!)
        result.append(checklistCompleted!)
        return result
    }
    
    
    
    
}
