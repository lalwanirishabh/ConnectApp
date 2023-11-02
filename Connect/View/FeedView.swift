//
//  FeedView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct FeedView: View {
    @State private var selectedTag: String? = nil
    let tags = ["Highlights", "Everyone"]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    
                }
            }
            .navigationBarItems(leading:
                Image("Icon")
                .resizable()
                .frame(width: 39, height: 39)
            )
            .navigationBarItems(trailing: HStack {
                            ForEach(tags, id: \.self) { tag in
                                ChipView(text: tag, isSelected: tag == selectedTag)
                                    .onTapGesture {
                                        selectedTag = tag
                                    }
                            }
            })
        }
    }
}

#Preview {
    FeedView()
}
