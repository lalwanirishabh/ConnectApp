//
//  AddDonationByAlumniView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct AddDonationByAlumniView: View {
    @State private var code: String = "abcdef"
    @State private var paymentId: String = ""
    @State private var Amount: String = ""
    @State private var Date: String = ""
    @State private var Description: String = ""
    @State private var showAlert: Bool = false
    let name: String
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        VStack{
            Image(uiImage: updateCode(code: code))
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: 170, height: 170)
                .padding(.top, 50)
            
            Spacer()
            
            TextField("Payment ID", text: $paymentId)
                                            .padding()
                                            .background(Color(.secondarySystemBackground))
                                            .cornerRadius(10)
                                            .padding(.horizontal)
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
            
            TextField("Amount", text: $Amount)
                                            .padding()
                                            .background(Color(.secondarySystemBackground))
                                            .cornerRadius(10)
                                            .padding(.horizontal)
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
            
            TextField("Date", text: $Date)
                                            .padding()
                                            .background(Color(.secondarySystemBackground))
                                            .cornerRadius(10)
                                            .padding(.horizontal)
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
            
            TextField("Description", text: $Description)
                                            .padding()
                                            .background(Color(.secondarySystemBackground))
                                            .cornerRadius(10)
                                            .padding(.horizontal)
                                            .disableAutocorrection(true)
                                            .autocapitalization(.none)
            
            Button(action: {
                APICallToFetchAllPosts()
            }, label: {
                ZStack {
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 347, height: 60)
                    .background(Color(red: 0.19, green: 0.45, blue: 0.84))
                    .cornerRadius(15)
                    
                    Text("Confirm")
                        .font(
                            Font.custom("Leelawadee UI", size: 20)
                            .weight(.bold)
                            )
                        .foregroundColor(.white)
                }
            })
            
            NavigationLink(destination: TransactionHistoryView(name: name)){
                            Text("Transaction History")
                        }
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Success"),
                            message: Text("Donation Details Added sucessfully"),
                            dismissButton: .default(Text("OK"))
                                )
                }
    }
    
    func updateCode(code: String) -> UIImage {
            return generateQRCode(from: code)
    }
    
    func generateQRCode(from string: String) -> UIImage {
            filter.message = Data(string.utf8)

            if let outputImage = filter.outputImage {
                if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgimg)
                }
            }
            return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func APICallToFetchAllPosts(){
        let json: [String: Any] = ["donation_id":"\(paymentId)", "amount":"\(Amount)", "date":"\(Date)", "description":" \(Description)", "alumni_name":"\(name)"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        let responseJSON = try? JSONSerialization.jsonObject(with: jsonData!, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        
        let url = URL(string:  Constants.url + "/alumniFund/addDonation")
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
                    if mess == "Donation added successfully"{
                        showAlert.toggle()
                    }
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
    AddDonationByAlumniView(name: "Fahad Israr")
}
