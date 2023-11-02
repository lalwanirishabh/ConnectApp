//
//  GetAlumniView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct GetAlumniView: View {
    @State private var alumnies: [AlumniStructure] = []
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                        APICallToFetchAllPosts()
                    })
    }
    
    func APICallToFetchAllPosts(){
        let url = URL(string: "https://alumni-api.onrender.com/alumni/getAlumni")
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
    
    func parseJSON(_ data: Data) -> [AlumniStructure]? {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(GetAlumniDetails.self, from: data)
                    print("data decoded")
                    for i in 0..<decodedData.alumni.count{
                        let alumni_id = decodedData.alumni[i].alumni_id
                        let name = decodedData.alumni[i].name
                        let grad_year = decodedData.alumni[i].grad_year
                        let contact_info = decodedData.alumni[i].contact_info
                        let company = decodedData.alumni[i].company
                        
                        let newAlumni = AlumniStructure(id: String(alumni_id), name: name, grad_year: grad_year, contact_info: contact_info, company: company)
                        
                        alumnies.append(newAlumni)
                    }
                    
                    
                    
                    return alumnies
                    
                } catch {
                    let erro = parseError(data)
                    return nil
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
    GetAlumniView()
}
