//
//  NotificationView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 03/11/23.
//

import SwiftUI

struct NotificationView: View {
    var name : String
    var groups: String
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                NotificationScreenView(name: "Rishabh Lalwani", Description: "We are thrilled to announce a fantastic opportunity for all budding developers and enthusiasts! 🚀 The Web Development Club is organizing a Hackathon🤩 as part of the annual technical fest, Atrang 2023", month: "SEPT", date: "27")
                NotificationScreenView(name: "Kshitiz Verma", Description: "The 44th Chess Olympiad was an international team chess event organised by the International Chess Federation (FIDE) in Chennai, India, in 2022.", month: "OCT", date: "19")
                NotificationScreenView(name: "Vaidik Bhongade", Description: "Wikipedia's purpose is to benefit readers by presenting information on all branches of knowledge. Hosted by the Wikimedia Foundation, it consists of freely editable content, whose articles also have numerous links to guide readers to more information.", month: "NOV", date: "8")
                NotificationScreenView(name: "Aman Kumar", Description: " A web developer's job is to create websites. While their primary role is to ensure the website is visually appealing and easy to navigate", month: "FEB", date: "12")
            }
            .navigationTitle("Notifications")
        }
    }
}

#Preview {
    NotificationView(name: "Fahad Israr", groups: "alumni")
}
