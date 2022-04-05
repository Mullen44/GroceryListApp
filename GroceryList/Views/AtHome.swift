//
//  Home.swift
//  GroceryList
//
//  Created by Andrew Mullen on 2022-04-02.
//

import SwiftUI

struct AtHome: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack{
            Spacer()
            ForEach(0..<11, id: \.self) { ind in
                Text("Home PlaceHolder")
                    .frame(height:40)
            }
            
            ForEach(model.atHome) { category in
                Text(category.category)
                ForEach(0..<category.items.count, id: \.self) {index in
                        let item = category.items[index]
                        Text(item.name)
                    }
                
            }
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        AtHome()
    }
}
