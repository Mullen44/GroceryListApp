//
//  ContentModel.swift
//  GroceryList
//
//  Created by Andrew Mullen on 2022-04-04.
//

import Foundation
import Firebase

class ContentModel: ObservableObject {
    // MARK: Initialize Class Properties
    // Declare Database
    let db = Firestore.firestore()
    
    // List of "lists"
    @Published var atHome = [Category]()
    @Published var isNeeded = [Category]()
    @Published var onList = [Category]()
    
    
    
    // Initialize
    init() {
        getAtHomeData()
    }
    
    // MARK: Database Methods
    func getAtHomeData() {
        print("In")
        // Specify collection path
        let listCollection = db.collection("atHome")
        
        // Get Documents
        listCollection.getDocuments { snapshot, error in
            
            // Check for nils
            if error == nil && snapshot != nil {
                
                // Array to track categories
                var categories = [Category]()
                
                for doc in snapshot!.documents {
                    var c = Category()
                    
                    c.id = doc["id"] as? String ?? UUID().uuidString
                    c.category = doc["Category"] as? String ?? ""
                    c.items = doc["items"] as? [Item] ?? [Item]()
                    
                    print(c.items)

                    categories.append(c)
                }
                // Assign our categories array to published atHome variable
                DispatchQueue.main.async {
                    self.atHome = categories
                }
                
            }
        }
        
        // Specify item Collection path
    }
    
    func getIsNeededData(category: Category) {
        // Specify collection path
        let item = db.collection("atHome").document(category.id)
        
        //
        print("Items")
        
    }
    
}
