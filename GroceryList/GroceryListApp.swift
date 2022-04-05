//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by Andrew Mullen on 2022-04-02.
//

import SwiftUI
import Firebase

@main
struct GroceryListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TabView().environmentObject(ContentModel())
        }
    }
}
