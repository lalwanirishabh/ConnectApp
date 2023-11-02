//
//  AddAlumniView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct AddAlumniView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                        APICallToFetchAllPosts()
                    })
    }
    
    func APICallToFetchAllPosts(){
        let json: [String: Any] = ["alumni_id":"004", "name":"Krishna Laddha", "grad_year":"2023", "contact_info":"linkedin_link", "company":"Celebal"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: "https://alumni-api.onrender.com/alumni/addAlumni")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
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
                    let decodedData = try decoder.decode(getPost.self, from: data)
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
    AddAlumniView()
}
