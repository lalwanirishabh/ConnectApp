//
//  GetPost.swift
//  Connect
//
//  Created by Rishabh Lalwani on 01/11/23.
//

import SwiftUI

struct GetPost: View {
    @State private var posts: [PostStructure] = []
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                        APICallToFetchAllPosts()
                    })
    }
    
    func APICallToFetchAllPosts(){
        let url = URL(string: "https://alumni-api.onrender.com/post/getPost")
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
                if let mydata = self.parseJSON(safeData) {
                }
            }
            
            
        }
        task.resume()
        
    }
    
    func parseJSON(_ data: Data) -> [PostStructure]? {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(getPost.self, from: data)
                    print("data decoded")
                    
                    
                    
                    return posts
                    
                } catch {
                    print("cant parse authorization data")
                    return nil
                }
            }
    
    
    
}

#Preview {
    GetPost()
}
