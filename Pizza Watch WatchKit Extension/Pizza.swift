//
//  Pizza.swift
//  PizzaCreatorWatch
//
//  Created by Óscar Calles Sáez on 16/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import WatchKit

class Pizza: NSObject {
    var size: String = ""
    var base: String = ""
    var cheese: String = ""
    var arrayIngredientsSelected:[String] = []
    
    override init(){
    
    }
    
    init(p:Pizza){
        size=p.size
        base=p.base
        cheese=p.cheese
        arrayIngredientsSelected=p.arrayIngredientsSelected
    }
}
