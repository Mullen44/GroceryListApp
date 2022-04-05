//
//  ContentView.swift
//  GroceryList
//
//  Created by Andrew Mullen on 2022-04-02.
//

import SwiftUI
import Firebase


enum Tab {
    case HomeList
    case NeedList
    case GroceryList
}

struct TabInfo: Identifiable {
    var id = UUID()
    var view: Tab
    var icon: String
    var name: String
}

struct TabView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var tabs = [TabInfo]()
    @State var selectedTab = Tab.HomeList
    
    var body: some View {
        GeometryReader {geo in
        
            VStack {
                Spacer()
                ScrollView{
                    switch(selectedTab) {
                    case Tab.HomeList:
                        AtHome()
                    case Tab.NeedList:
                        AtStore()
                    case Tab.GroceryList:
                        GroceryList()
                    }
                }
                
                Spacer()
                
                // Create tab bar
                VStack{
                    Path({ path in
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                        })
                            .stroke(.gray)
                    HStack {
                        Spacer()
                        ForEach(tabs) { tab in
                            ZStack{
                                VStack{
                                    Image(systemName: tab.icon)
                                        .padding(.bottom)
                                    Text(tab.name)
                                }
                                .foregroundColor(tab.view == selectedTab ? .blue : .black)
                                .padding(.vertical)
                                .frame(width: (geo.size.width-40)/3)
                                .onTapGesture {
                                    self.selectedTab = tab.view
                                }
                            }
                            Spacer()
                        }
                    }
                }
                .frame(height:108)
            }
            .ignoresSafeArea(edges: .bottom)
            .onAppear {
                // Create Tabs
                var newTabs = [TabInfo]()
                newTabs.append(TabInfo(view: Tab.HomeList, icon: "house.fill", name: "At Home"))
                newTabs.append(TabInfo(view: Tab.NeedList, icon: "cart.fill", name: "Need"))
                newTabs.append(TabInfo(view: Tab.GroceryList, icon: "list.star", name: "List"))
                
                self.tabs = newTabs
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabView()
        }
    }
}
