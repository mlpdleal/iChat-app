//
//  iChatApp.swift
//  iChat
//
//  Created by Manoel Leal on 03/10/22.
//

import SwiftUI
import Firebase

@main
struct iChatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
