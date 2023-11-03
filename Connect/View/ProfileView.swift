//
//  ProfileView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var user: AlumniStructure = AlumniStructure(id: "", name: "", grad_year: "", contact_info: "", company: "")
    let name: String
    let groups: String
    
    @State private var navigateToLogInView: Bool = false
    
    
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
                        
                        Text("Batch \(user.grad_year)")
                        .font(Font.custom("Leelawadee UI", size: 15))
                        .foregroundColor(.black)
                        
                    }
                    .padding(.leading, 40)
                    
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 349, height: 448)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.25))
                        .cornerRadius(15)
                        .padding(.top, 10)
                    
                    VStack{
                        Text(user.contact_info)
                            .onTapGesture {
                                if let url = URL(string: user.contact_info) {
                                                    UIApplication.shared.open(url)
                                                }
                                            }
                        
                        Text("Currently employed by \(user.company)")
                    }
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Edit Profile")
                        .font(Font.custom("Leelawadee UI", size: 15))
                        .foregroundColor(Color(red: 0.64, green: 0.62, blue: 0.62))
                        .padding(.top, 10)
                })
                
                    NavigationLink(destination: PaymentDetailsView(name: name)){
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
                        .padding(.top, 10)
                    }
                
                Button(action: {
                    navigateToLogInView.toggle()
                }, label: {
                    Text("Log out")
                    .font(Font.custom("Leelawadee UI", size: 15))
                    .foregroundColor(Color(red: 0.64, green: 0.62, blue: 0.62))
                    .padding(.top, 10)
                })
                
            }
        }
        .fullScreenCover(isPresented: $navigateToLogInView, content: {
                    LogInView()
                })
        .onAppear(perform: {
                APICallToFetchAllPosts()
                })
        
        
        
    }
    
    func APICallToFetchAllPosts(){
        var urlString: String = "http://192.168.1.8:3000/alumni/getAlumniByName/\(name)"
        let url = URL(string: urlString)
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
            
            if let data = data, let string = String(data: data, encoding: .utf8){
                        print(string)
            }
            
            if let safeData = data {
                self.parseJSON(safeData)
            }
            
            
        }
        task.resume()
        
    }
    
    func parseJSON(_ data: Data){
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(GetAlumniDetails.self, from: data)
                    print("data decoded")
                    user.grad_year = String(decodedData.alumni[0].grad_year)
                    user.company = decodedData.alumni[0].company
                    user.contact_info = decodedData.alumni[0].contact_info
                    print(user.grad_year)
                    
                } catch {
                    let erro = parseError(data)
                }
    }
    
    func parseError(_ data: Data) -> String{
        var erro: String = ""
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(err.self, from: data)
            print("data decoded")
            
            
            
            return erro
            
        } catch {
            print("cant parse authorization data")
            return ""
        }
    }
    
}

#Preview {
    ProfileView(name: "Fahad Israr", groups: "alumni")
}
