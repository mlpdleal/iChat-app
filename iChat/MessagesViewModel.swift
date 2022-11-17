//
//  MessagesViewModel.swift
//  iChat
//
//  Created by Manoel Leal on 17/11/22.
//

import Foundation
import FirebaseAuth

class MessagesViewModel: ObservableObject {
    
    func logout() {
        try? Auth.auth().signOut()
    }
}
