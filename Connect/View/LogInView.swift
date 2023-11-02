//
//  LogInView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        VStack{
            Image("Icon")
                .resizable()
                .frame(width: 70, height: 70)
            
            Text("Log in ")
                .font(Font.custom("Leelawadee UI", size: 30)
                    .weight(.bold))
                .foregroundColor(.black)
            
            Text("Welcome back! 👋")
              .font(
                Font.custom("Leelawadee UI", size: 20)
                  .weight(.bold)
              )
              .foregroundColor(Color(red: 0.58, green: 0.58, blue: 0.6))
            
            TextField("Email", text: $email)
                                            .padding()
                                            .background(Color(.secondarySystemBackground))
                                            .cornerRadius(10)
                                            .padding(.horizontal)
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)

                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
            
            Button(action: {

            }) {
                            Text("Log In")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.91, green: 0.32, blue: 0.35))
                                .cornerRadius(15)
                                .padding(.horizontal)
                                       }
            
            NavigationLink(destination: Text("Forgot Password View")) {
                                                Text("Forgot Password?")
                                            }
            
        }
        .background(.white)
    }
}

#Preview {
    LogInView()
}
