//
//  AlumniView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 03/11/23.
//

import SwiftUI

struct AlumniView: View {
    var alumni: AlumniStructure
    
    var body: some View {
        ZStack{
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 367, height: 77)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(20)
            
            HStack {
                Image(systemName : "person.crop.circle.fill")
                    .resizable()
                .frame(width: 56, height: 56)
                
                Text(alumni.name)
                    .font(
                    Font.custom("Leelawadee UI", size: 17)
                    .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 247, height: 24, alignment: .topLeading)
                    .padding(.leading)

                
            }
        }
    }
}

#Preview {
    AlumniView(alumni: AlumniStructure(id: "001", name: "Fahad Israr", grad_year: "2021", contact_info: "LinkedInUrl", company: "Redhat"))
}
