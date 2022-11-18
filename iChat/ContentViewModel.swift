//
//  ContentViewModel.swift
//  iChat
//
//  Created by Manoel Leal on 17/11/22.
//

import Foundation
import FirebaseAuth

class ContentViewModel: ObservableObject {
    
    @Published var isLogged = Auth.auth().currentUser != nil
    
    /*
     * Dentro da biblioteca do Firebase auth tem uma funcao de callback (listener) de eventos
     * essa funcao serve para toda vez que a propriedade muda ela e chamada
     */
    
    func onAppear() {
        Auth.auth().addStateDidChangeListener{ auth, user in
            self.isLogged = user != nil
        }
    }
    
}
