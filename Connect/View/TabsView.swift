//
//  TabsView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct TabsView: View {
    let name: String
    let groups: String
    
    var body: some View {
        TabView{
            GetPostView(name: name, groups: groups)
                .tabItem {
                    Image(systemName: "house.circle")
                }
            GetAlumniView(name: name, groups: groups)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            NotificationView(name: name, groups: groups)
                .tabItem {
                    Image(systemName: "bell.fill")
                }
            ProfileView(name: name, batch: "2021", groups: groups)
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }
            
            
        }
    }
}

#Preview {
    TabsView(name: "Fahad Israr", groups: "alumni")
}
