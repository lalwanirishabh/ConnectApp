//
//  TabsView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct TabsView: View {
    @Binding var name: String
    @Binding var groups: String
    
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
            ProfileView(name: name, groups: groups)
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }
            
            
        }
        .onAppear(){
            print(name)
            print(groups)
        }
    }
}

#Preview {
    TabsView(name: .constant("Fahad Israr"), groups: .constant("users"))
}
