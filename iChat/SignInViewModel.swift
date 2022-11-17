//
//  SignInViewModel.swift
//  iChat
//
//  Created by Manoel Leal on 15/11/22.
//

import Foundation
import FirebaseAuth

class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var formInvalid = false
    var alertText = ""
    
    @Published var isLoading = false
    
    func signIn(){
        self.isLoading = true
        print("email: \(email), senha: \(password)")
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard let user = result?.user, error == nil else {
                self.formInvalid = true
                self.alertText = error!.localizedDescription
                print(error)
                self.isLoading = false
                return
            }
            self.isLoading = false
        }
    }
    
}

