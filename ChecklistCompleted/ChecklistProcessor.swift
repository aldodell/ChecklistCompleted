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
                var openTagPos = line.index(line.firstIndex(of: "#")!, offsetBy: 1)
                let endTagPos = line.lastIndex(of: "#")!
                let data = String(line[openTagPos..<endTagPos])
                result.append(data)
            }
            
        }
        return result
    }
    
    
}
