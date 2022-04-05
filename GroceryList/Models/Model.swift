//
//  Model.swift
//  GroceryList
//
//  Created by Andrew Mullen on 2022-04-04.
//

import Foundation

struct Category: Identifiable {
    var id: String = ""
    var category: String = ""
    var items = [Item]()
}

struct Item: Identifiable {
    var id: String = ""
    var name: String = ""
    var quantity: Int = 0
    
}

