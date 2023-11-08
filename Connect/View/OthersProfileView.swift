//
//  OthersProfileView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 03/11/23.
//

import SwiftUI

struct OthersProfileView: View {
    var name: String
    var batch: String
    var contact_info: String
    var company: String
    
    
    var body: some View {
        NavigationView {
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
                    
                    VStack(alignment: .leading ){
                        Text(name)
                            .font(
                                Font.custom("Leelawadee UI", size: 22)
                                .weight(.bold)
                            )
                            .foregroundColor(.black)
                        
                        Text("Batch \(batch)")
                        .font(Font.custom("Leelawadee UI", size: 15))
                        .foregroundColor(.black)
                        
                    }
                    .padding(.leading, 40)
                    
                }
                .padding(.top, 20)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.25))
                        .cornerRadius(15)
                        .padding(.top, 10)
                    
                    VStack{
                        Text("LinkedIn Profile")
                                .font(.headline)
                            
                            Text(contact_info)
                                .font(.body)
                                .foregroundColor(.blue)
                                .underline()
                                .onTapGesture {
                                    if let url = URL(string: contact_info), UIApplication.shared.canOpenURL(url) {
                                        UIApplication.shared.open(url)
                                    }
                                }
                            
                            Text("Currently employed by")
                                .font(.headline)
                            
                            Text(company)
                                .font(.body)                    }
                }
                
            }
        }
    }
}

#Preview {
    OthersProfileView(name: "Fahad Israr", batch: "2021", contact_info: "https://www.linkedin.com/in/rishabh-lalwani-a96740254/", company: "Redhat")
}
