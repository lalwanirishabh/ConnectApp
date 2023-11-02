//
//  GetAlumniFundView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct GetAlumniFundView: View {
    @State private var funds: [FundStructure] = []
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                        APICallToFetchAllPosts()
                    })
    }
    
    func APICallToFetchAllPosts(){
        let url = URL(string: "https://alumni-api.onrender.com/alumniFund/getDonations")
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
    
    func parseJSON(_ data: Data) -> [FundStructure]? {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(getAlumniFunds.self, from: data)
                    print("data decoded")
                    
                    for i in 0..<decodedData.funds.count{
                        let donation_id: String = String(decodedData.funds[i].donation_id)
                        let amount: String = decodedData.funds[i].amount
                        let date: String = decodedData.funds[i].date
                        let description: String = decodedData.funds[i].description
                        let alumni_name: String = decodedData.funds[i].alumni_name
                        
                        let newFund = FundStructure(id: donation_id, amount: amount, date: date, description: description, name: alumni_name)
                        
                        funds.append(newFund)
                    }
                    
                    
                    return funds
                    
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
    GetAlumniFundView()
}
