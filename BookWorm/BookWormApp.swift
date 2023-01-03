//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import SwiftUI

@main
struct BookWormApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
}
