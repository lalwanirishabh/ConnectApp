//
//  AddDonationByAlumniView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct AddDonationByAlumniView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                        APICallToFetchAllPosts()
                    })
    }
    
    func APICallToFetchAllPosts(){
        let json: [String: Any] = ["donation_id":"001", "amount":"10000", "date":"25/12/2023", "description":" Long detailed description", "alumni_name":"Fahad Israr"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: "https://alumni-api.onrender.com/alumniFund/addDonation")
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
//                if let mydata = self.parseJSON(safeData) {
//                }
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
    AddDonationByAlumniView()
}
