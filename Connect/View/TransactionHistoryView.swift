//
//  TransactionHistoryView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 03/11/23.
//

import SwiftUI

struct TransactionHistoryView: View {
    @State private var history: [FundStructure] = []
    var name: String
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(history){ hist in
                        FundView(fund: hist)
                            .padding()
                    }
                }
            }
            .navigationTitle("History")
        }
        .onAppear(perform: {
//                    APICallToFetchAllPosts()
                })
    }
    
    func APICallToFetchAllPosts(){
        var urlString = "http://192.168.1.8:3000/alumniFund/getDonations/\(name)"
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
                    for i in 0..<decodedData.alumni.count{
                        let donation_id: String = String(decodedData.alumni[i].donation_id)
                        let amount: String = String(decodedData.alumni[i].amount)
                        let date: String = decodedData.alumni[i].date
                        let description: String = decodedData.alumni[i].description
                        
                        let newFund = FundStructure(id: donation_id, amount: amount, date: date, description: description, name: "Fahad Israr")
                        history.append(newFund)
                    }
                    
                    
                    return history
                    
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
    TransactionHistoryView(name: "Fahad Israr")
}
