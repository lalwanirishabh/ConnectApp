//
//  GetPost.swift
//  Connect
//
//  Created by Rishabh Lalwani on 01/11/23.
//

import SwiftUI

struct GetPostView: View {
    
    let name : String
    let groups: String
    
    @State private var selectedTag: String? = "Everyone"
    @State private var route: String = ""
    let tags = ["Highlights", "Everyone"]
    @State private var posts: [PostStructure] = []
    
    var body: some View {
        NavigationView{
            ZStack {
                ScrollView{
                    VStack{
                        ForEach(posts){ post in
                            PostView(post: post)
                                .padding()
                        }
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
                                            if selectedTag! == "Everyone"{
                                                route = ""
                                            }else if selectedTag! == "Highlights"{
                                                route = "ByGroup"
                                            }
                                            posts.removeAll()
                                            APICallToFetchAllPosts()
                                        }
                                }
            })
                
                NavigationLink(destination: AddPostView(name: name, groups: groups)) {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ZStack{
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color(red: 0.91, green: 0.32, blue: 0.35))
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing, 30)
                            }
                        }
                    }
                }
                
            }
            .onAppear(perform: {
                        APICallToFetchAllPosts()
                    })
    }
    
    func APICallToFetchAllPosts(){
        var urlString = "http://192.168.1.8:3000/post/getPost"
        urlString += route
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
    
    func parseJSON(_ data: Data) -> [PostStructure]? {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(getPost.self, from: data)
                    print("data decoded")
                    for i in 0..<decodedData.posts.count{
                        let name: String = decodedData.posts[i].name
                        let title: String = decodedData.posts[i].title
                        let content: String = decodedData.posts[i].content
                        
                        let newPost = PostStructure(id: "001", name: name, title: title, content: content)
                        posts.append(newPost)
                    }
                    
                    
                    return posts
                    
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
    GetPostView(name: "Fahad Israr", groups: "alumni")
}
