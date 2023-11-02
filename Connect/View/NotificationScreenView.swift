//
//  NotificationScreenView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 03/11/23.
//

import SwiftUI

struct NotificationScreenView: View {
    var name: String
    var Description: String
    var month: String
    var date: String
    
    var body: some View {
        HStack(){
            ZStack {
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 69, height: 76)
                .background(.white)
                .cornerRadius(15)
                .overlay(
                RoundedRectangle(cornerRadius: 15)
                .inset(by: 0.5)
                .stroke(.black, lineWidth: 1)
            )
                
                ZStack {
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 60, height: 28)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(12)
                    
                    Text(month)
                    .font(Font.custom("Leelawadee UI", size: 14))
                    .foregroundColor(.black)
                    .frame(width: 37, height: 24, alignment: .topLeading)
                    .padding(.top, 7)
                    
                }
                .padding(.top, -35)
                
                Text(date)
                    .padding(.bottom, -26)
                    .font(
                        Font.custom("Leelawadee UI", size: 25)
                        .weight(.bold)
                    )
                
                
            }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(
                        Font.custom("Leelawadee UI", size: 20)
                        .weight(.bold)
                    )
                Text(Description)
            }
        }
        .padding(.vertical)
        
    }
}

#Preview {
    NotificationScreenView(name: "Rishabh Lalwani", Description: "We are thrilled to announce a fantastic opportunity for all budding developers and enthusiasts! 🚀 The Web Development Club is organizing a Hackathon🤩 as part of the annual technical fest, Atrang 2023", month: "SEPT", date: "27")
}
