//
//  LogInView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct LogInView: View {
    @State private var navigateToTabsView: Bool = false
    @State private var email: String = "211134@iiitt.ac.in"
    @State private var password: String = "sunnykumar"
    
    @State private var username: String = ""
    @State private var groups: String = ""
    
    
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
                APICallToFetchAllPosts()
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
        .fullScreenCover(isPresented: $navigateToTabsView, content: {
            TabsView(name: username, groups: groups)
                })
    }
    
    func APICallToFetchAllPosts(){
        let json: [String: Any] = ["email":"\(email)", "password":"\(password)"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        let responseJSON = try? JSONSerialization.jsonObject(with: jsonData!, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        
        let url = URL(string: "http://192.168.1.8:3000/auth/login")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    print(responseJSON)
                }
            
            if let data = data, let string = String(data: data, encoding: .utf8){
                        print(string)
            }
            
            if let safeData = data {
                if self.parseJSON(safeData) != nil {
                }
            }
            
            
        }
        task.resume()
        
    }
    
    func parseJSON(_ data: Data) {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(authorisation.self, from: data)
                    print("data decoded")
                    
                    username = decodedData.username
                    groups = decodedData.groups
                    navigateToTabsView.toggle()
                    
                } catch {
                    let erro = parseError(data)
                }
    }
    
    func parseError(_ data: Data) -> String{
        var erro: String = ""
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(err.self, from: data)
            let err = decodedData.error
            print(err)
            
            
            
            return erro
            
        } catch {
            print("cant parse authorization data")
            return ""
        }
    }
}

#Preview {
    LogInView()
}
