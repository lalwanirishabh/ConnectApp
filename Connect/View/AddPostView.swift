//
//  addPost.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct AddPostView: View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                        APICallToFetchAllPosts()
                    })
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
        let json: [String: Any] = ["name":"Sunny", "title":"Technical", "content":"Atrang"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        print(isValidJSON(jsonData!))
        let responseJSON = try? JSONSerialization.jsonObject(with: jsonData!, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        
        let url = URL(string: "https://alumni-api.onrender.com/post/addPost")
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
                    return ""
                    
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
            print("data decoded")
            
            
            
            return erro
            
        } catch {
            print("cant parse authorization data")
            return ""
        }
    }
    
}

#Preview {
    AddPostView()
}
