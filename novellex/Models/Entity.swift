//
//  Entity.swift
//  novellex
//
//  Created by Κάϊφας Στρομαί on 6/4/22.
//

import Foundation

struct Entity:Identifiable{
    var id:Int
    var name:String
    var components:[Component]
    
}
