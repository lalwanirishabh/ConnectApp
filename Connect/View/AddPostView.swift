//
//  addPost.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct AddPostView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    
    let name: String
    let groups: String
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Title", text: $title)
                                            .padding()
                                            .background(Color(.secondarySystemBackground))
                                            .cornerRadius(10)
                                            .padding(.horizontal)
                
                TextField("Description", text: $description)
                                            .padding()
                                            .background(Color(.secondarySystemBackground))
                                            .cornerRadius(10)
                                            .padding(.horizontal)
                
                Button(action: {
                    
                }, label: {
                    ZStack{
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 345, height: 63)
                        .background(.white)

                        .cornerRadius(15)
                        .overlay(
                        RoundedRectangle(cornerRadius: 15)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.91, green: 0.32, blue: 0.35), lineWidth: 1)

                        )
                        
                        HStack{
                            Text("Upload Image")
                                .font(
                                Font.custom("Leelawadee UI", size: 15)
                                .weight(.bold)
                                )
                            .foregroundColor(Color(red: 0.92, green: 0.4, blue: 0.43))
                            
                            Image(systemName: "square.and.arrow.up.fill")
                                .foregroundColor(Color(red: 0.92, green: 0.4, blue: 0.43))
                        }
                        
                        
                    }
                })
                
                Button(action: {
                    APICallToFetchAllPosts()
                }, label: {
                    ZStack {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 345, height: 63)
                        .background(Color(red: 0.91, green: 0.32, blue: 0.35))
                        .cornerRadius(15)
                        
                        Text("Post")
                        .font(
                        Font.custom("Leelawadee UI", size: 15)
                        .weight(.bold)
                        )
                        .foregroundColor(.white)
                    }
                })
                
                
            }
            .navigationTitle("Add Post")
        }
    }
    
    func isValidJSON(_ data: Data) -> Bool {
            do {
                _ = try JSONSerialization.jsonObject(with: data, options: [])
                return true // Parsing succeeded; it's a valid JSON.
            } catch {
                return false // Parsing failed; it's not valid JSON.
            }
    }
    
    func APICallToFetchAllPosts(){
        let json: [String: Any] = ["name":"\(name)", "title":"\(title)", "content":"\(description)", "groups":"\(groups)"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        print(isValidJSON(jsonData!))
        let responseJSON = try? JSONSerialization.jsonObject(with: jsonData!, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        
        let url = URL(string: "http://192.168.1.8:3000/post/addPost")
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
    
    func parseJSON(_ data: Data) -> String {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(mess.self, from: data)
                    print("data decoded")
                    let mess = decodedData.message
                    print(mess)
                    return mess
                    
                } catch {
                    let erro = parseError(data)
                    return erro
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
    AddPostView(name: "Fahad Israr", groups: "alumni")
}
