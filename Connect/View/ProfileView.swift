//
//  ProfileView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            HStack{
                ZStack {
                    Circle()
                        .frame(width: 155, height: 155)
                    .foregroundColor(Color(red: 0.91, green: 0.32, blue: 0.35))
                    
                    Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                }
                
                VStack {
                    Text("Kshitij Verma ")
                        .font(
                            Font.custom("Leelawadee UI", size: 22)
                            .weight(.bold)
                        )
                        .foregroundColor(.black)
                    
                    Text("Batch 2025")
                    .font(Font.custom("Leelawadee UI", size: 15))
                    .foregroundColor(.black)
                    
                }
                .padding(.leading, 40)
            }
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 349, height: 448)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.25))
                .cornerRadius(15)
            }
        
        
        Button(action: {
            
        }, label: {
            Text("Edit Profile")
                .font(Font.custom("Leelawadee UI", size: 15))
                .foregroundColor(Color(red: 0.64, green: 0.62, blue: 0.62))
        })
        
        Button(action: {
            
        }, label: {
            ZStack {
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 349, height: 38)
                .background(Color(red: 1, green: 0.96, blue: 0.88))
                .cornerRadius(15)
                
                HStack{
                    Image(systemName: "book.closed.fill")
                        .foregroundColor(.black)
                        .padding(.leading, 30)
                    Spacer()
                    
                    Text("Donate to Alumni Fund")
                        .font(
                            Font.custom("Leelawadee UI", size: 15)
                            .weight(.bold)
                            )
                        .foregroundColor(.black)
                        .padding(.trailing, 50)
                    
                    Spacer()
                }
            }
        })
        
        Button(action: {
            
        }, label: {
            Text("Log out")
            .font(Font.custom("Leelawadee UI", size: 15))
            .foregroundColor(Color(red: 0.64, green: 0.62, blue: 0.62))
        })
    }
}

#Preview {
    ProfileView()
}
