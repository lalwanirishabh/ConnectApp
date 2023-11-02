//
//  TabsView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView{
            GetPostView()
                .tabItem {
                    Image(systemName: "house.circle")
                }
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            NotificationView()
                .tabItem {
                    Image(systemName: "bell.fill")
                }
            ProfileView(name: "Fahad Israr", batch: "2021")
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }
            
            
        }
    }
}

#Preview {
    TabsView()
}
