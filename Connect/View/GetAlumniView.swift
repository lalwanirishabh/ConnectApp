//
//  GetAlumniView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct GetAlumniView: View {
    var name: String
    var groups: String
    
    @State private var alumnies: [AlumniStructure] = []
    @State private var route: String = ""
    
    @State private var searchedText: String = ""
    @State private var selectedTag: String? = nil
    let tags = ["Name", "Company" ,"Batch"]
    
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    
                    ZStack(alignment: .trailing) {
                        TextField("Search...", text: $searchedText)
                            .onSubmit {
                                    alumnies.removeAll()
                                    APICallToFetchAllPosts()
                            }
                            .padding(12)
                            .padding(.horizontal, 24)
                            .background(Color(.systemGray6))
                            .cornerRadius(20)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)
                                }
                            )
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "delete.left.fill")
                                .foregroundColor(.black)
                        })
                        .padding(.trailing)
                    }
                    .padding(.trailing)
                    
                }
                
                HStack{
                    ForEach(tags, id: \.self) { tag in
                        ChipView(text: tag, isSelected: tag == selectedTag)
                            .onTapGesture {
                                selectedTag = tag
                                if selectedTag! == "Name"{
                                    route = "ByName/"
                                }else if selectedTag! == "Company"{
                                    route = "/"
                                }else if selectedTag! == "Batch"{
                                    route = "ByYear/"
                                }
                            }
                            .padding(.horizontal, 20)
                    }
                }
                
                ScrollView{
                    VStack{
                        ForEach(alumnies){ alumni in
                            NavigationLink(destination: OthersProfileView(name: alumni.name, batch: alumni.grad_year, contact_info: alumni.contact_info, company: alumni.company)){
                                AlumniView(alumni: alumni)
                            }
                            
                        }
                    }
                }
                
                Spacer()
                
                
            }
                .onAppear(perform: {
                            APICallToFetchAllPosts()
            })
        }
    }
    
    func APICallToFetchAllPosts(){
        var urlString: String = "http://192.168.1.8:3000/alumni/getAlumni"
        route.append(searchedText)
        urlString += route
        print(urlString)
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
    
    func parseJSON(_ data: Data) -> [AlumniStructure]? {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(GetAlumniDetails.self, from: data)
                    print("data decoded")
                    for i in 0..<decodedData.alumni.count{
                        let alumni_id = decodedData.alumni[i].alumni_id
                        let name = decodedData.alumni[i].name
                        let grad_year = String(decodedData.alumni[i].grad_year)
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
    GetAlumniView(name: "Fahaf Israr", groups: "alumni")
}
