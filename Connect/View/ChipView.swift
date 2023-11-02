//
//  ChipView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct ChipView: View {
    let text: String
    let isSelected: Bool

        var body: some View {
            Text(text)
                .padding(8)
                .background(isSelected ? Color(red: 0.91, green: 0.32, blue: 0.35) : Color.white)
                .foregroundColor(isSelected ? .white : .black)
                .cornerRadius(16)
        }
}

#Preview {
    ChipView(text: "Everyone", isSelected: true)
}
