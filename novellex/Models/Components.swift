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



protocol ComponentView:View{
    associatedtype Comp: Component
    var component:Comp{get}
    static func from(c:Comp)->Self
}
struct NameComponentView: ComponentView{
    typealias Comp=NameComponent
    var component: NameComponent
    var body: some View{
        Text(component.name)
    }
    static func from(c: NameComponent) -> NameComponentView {
        return NameComponentView(component: c)
    }
    
}
struct StringFieldComponentView:ComponentView{
    typealias Comp=StringFieldComponent
    var component: StringFieldComponent
    @State private var field_value:String=""
    
    var body: some View{
        HStack{
            Text(component.field_name)
            TextField("Field",text:$field_value)
        }
    }
    static func from(c:Comp)->Self{
        return StringFieldComponentView(component: c)
    }
}


class Component : Identifiable{
    var id:UUID
    var owning_entity:UUID
    func generate_view()->AnyView{
        AnyView(Text("Bad"))
        
    }
    func get_component_name()->String{
        "SuperComponent!"
    }
    init(id:UUID, owning_entity:UUID){
        self.id=id
        self.owning_entity=owning_entity
    }
    
}
struct SuperComponentView:ComponentView{
    typealias Comp=NameComponent
    var component: NameComponent
    var body: some View{
        Text("This is bad. Go debug it you hobo!")
    }
    static func from(c:Comp)->Self{
        return SuperComponentView(component: c)
    }
    
}
class NameComponent:Component{
    var name:String = "Mark Antony"
    override func generate_view() -> AnyView{
        AnyView(NameComponentView(component: self))
    }
    override func get_component_name()->String{
        "Name"
    }
    init(id:UUID,owning_entity:UUID ,name:String){
        self.name=name
        super.init(id:id, owning_entity: owning_entity)
    }
    
}
struct StringField{
    var field_name:String="Default"
    var field_value:String="Default"
}
class StringFieldComponent:Component{
    var field_name:String
    var value:String
    var vals:[StringField]
    override func generate_view() -> AnyView {
        AnyView( StringFieldComponentView(component: self))
    }
    init(id: UUID,owning_entity:UUID, field_name:String, value:String){
        self.field_name=field_name
        self.value=value
        self.vals=[StringField(field_name: field_name, field_value: value)]
        super.init(id:id, owning_entity: owning_entity)
        
        
    }
    
}


