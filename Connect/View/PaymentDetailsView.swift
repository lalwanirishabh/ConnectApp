//
//  PaymentDetailsView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct PaymentDetailsView: View {
    @State private var code: String = "abcdef"
    @State private var paymentId: String = ""
    @State private var Amount: String = ""
    @State private var Date: String = ""
    @State private var Description: String = ""
    
    
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
            
            TextField("Email", text: $Amount)
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
            
            NavigationLink(destination: Text("Payment History")){
                Text("Tranaction History")
            }
            
            Spacer()
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
}

#Preview {
    PaymentDetailsView()
}
