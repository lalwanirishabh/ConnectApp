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
            FeedView()
                .tabItem {
                    Image(systemName: "house.circle")
                }
            Text("Search View")
                .tabItem {
                    Image(systemName: "house.circle")
                }
            Text("Notification View")
                .tabItem {
                    Image(systemName: "house.circle")
                }
            Text("Profile View")
                .tabItem {
                    Image(systemName: "house.circle")
                }
            
            
        }
    }
}

#Preview {
    TabsView()
}
