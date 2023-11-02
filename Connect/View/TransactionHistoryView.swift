//
//  TransactionHistoryView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 03/11/23.
//

import SwiftUI

struct TransactionHistoryView: View {
    @State private var history: [FundStructure] = []
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    ForEach(history){ hist in
                        FundView(fund: hist)
                            .padding()
                    }
                }
            }
            .navigationTitle("History")
        }
    }
}

#Preview {
    TransactionHistoryView()
}
