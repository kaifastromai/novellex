//
//  Components.swift
//  novellex
//
//  Created by Κάϊφας Στρομαί on 6/5/22.
//

import Foundation
import SwiftUI

enum ComponentTypes:Int{
    case Location=1
    case StringField
    case NumericalField
    case Sex
    case Age
    case Name
    case CharacterName
    case Binary
    case Relationship
    case Arc
}
protocol ComponentTy{
     var component_id:UUID{get}
    static var component_name:String{get}
   
}
struct NameComponent:ComponentTy{
   let component_id: UUID
   static let component_name="NameComponent"
    
}

class Component{
    let id:UUID
    init(id:UUID){
        self.id=id
    }
}
