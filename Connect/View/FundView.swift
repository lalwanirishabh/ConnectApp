//
//  FundView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct FundView: View {
    let fund: FundStructure
    var body: some View {
        VStack(alignment: .leading){
            Text("Donation id: \(fund.id)")
            Text("Amount: \(fund.amount)")
            Text("Date: \(fund.date)")
            Text("Description: \(fund.description)")
        }
        .padding()
    }
}

#Preview {
    FundView(fund: FundStructure(id: "001", amount: "10000", date: "15/08/2023", description: "Long Detailed Description", name: "Fahad Israr"))
}
