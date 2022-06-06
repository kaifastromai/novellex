//
//  EntityView.swift
//  novellex
//
//  Created by Κάϊφας Στρομαί on 6/5/22.
//

import SwiftUI

struct EntityView: View {
    var entity:Entity
    var body: some View {
        GroupBox(label:Label(entity.name, systemImage: "bolt.fill")){
            List(entity.components){
                $0.generate_view()
            }
        }
    }
}

struct EntityView_Previews: PreviewProvider {
    static var previews: some View {
        let ar:[Component]=[NameComponent(id:UUID(),owning_entity:UUID(), name:"AndrewGallespy"),NameComponent(id:UUID(), owning_entity: UUID(),name:"Jakob"),
                            StringFieldComponent(id:UUID(), owning_entity: UUID(),field_name: "Age",value: "32")]
        let entity=Entity(id:0,name:"Entity",components: ar)
        EntityView(entity:entity)
    }
}
