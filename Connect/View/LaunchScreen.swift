//
//  LaunchScreen.swift
//  Connect
//
//  Created by Rishabh Lalwani on 02/11/23.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var SplashScreenActive: Bool = false
    
    
    var body: some View {
        
        if SplashScreenActive{
            TabsView()
        }else{
            HStack(alignment: .center, spacing: 9) {
                Image("Icon")
                    .resizable()
                    .frame(width: 70, height: 70)
                
                Image("Connect")
                    .resizable()
                    .frame(width: 235, height: 60)
                
            }
                .padding(.leading, 36)
                .padding(.trailing, 43)
                .padding(.vertical, 0)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+50, alignment: .leading)
                .background(Color(red: 0.91, green: 0.32, blue: 0.35))

            .cornerRadius(25)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        SplashScreenActive = true
                    }
                }
        }
        
    }
}

#Preview {
    LaunchScreen()
}
