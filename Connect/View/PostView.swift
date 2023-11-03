//
//  PostView.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct PostView: View {
    var post: PostStructure
    @State private var didLike: Bool = false
    @State private var didBookmark: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 56, height: 56)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text(post.name)
                            .font(.title2).bold()
                        
                        Text("2w")
                                .font(.caption)
                                .foregroundColor(.gray)
                    }
                    
                    Text(post.title)
                        .font(.headline)
                    
                    Text(post.content)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                    HStack{
                        Button {
                            didLike.toggle()
                        } label: {
                            Image(systemName: didLike ?? false ? "heart.fill" : "heart")
                                .font(.subheadline)
                                .foregroundColor(didLike ?? false ? .red : .gray)
                        }
                        
                        Spacer()
                        
                        Button {
                            //Action here
                        } label: {
                            Image(systemName: "bubble.left")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Button {
                            //Action here
                        } label: {
                            Image(systemName: "arrow.2.squarepath")
                                .font(.subheadline)
                        }
                        
                        
                        Spacer()
                        
                        Button {
                            didBookmark.toggle()
                        } label: {
                            Image(systemName: didBookmark ?? false ? "bookmark.fill" : "bookmark")
                                .font(.subheadline)
                                .foregroundColor(didBookmark ?? false ? .blue : .gray)
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    PostView(post: PostStructure(id: "001", name: "Rishabh Lalwani", title: "Github as a resource builder", content: "Prepare for a career in tech by joining GitHub Global Campus. Global Campus will help you get the practical industry knowledge you need by giving you access to industry tools, events, learning resources and a growing student community."))
}
