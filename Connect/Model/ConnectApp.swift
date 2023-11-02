//
//  ConnectApp.swift
//  Connect
//
//  Created by Rishabh Lalwani on 01/11/23.
//

import SwiftUI

@main
struct ConnectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
