//
//  SearchAlumniView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct SearchAlumniView: View {
    @State private var searchedText: String = ""
    @State private var selectedTag: String? = nil
    let tags = ["Name", "Company" ,"Batch"]
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                    .resizable()
                    .frame(width: 30 , height: 30)
                
                ZStack(alignment: .trailing) {
                    TextField("Search...", text: $searchedText)
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
                        }
                        .padding(.horizontal, 20)
                }
            }
            
            Spacer()
            
            
        }
    }
}

#Preview {
    SearchAlumniView()
}
