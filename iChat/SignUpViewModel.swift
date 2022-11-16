//
//  SignUpViewModel.swift
//  iChat
//
//  Created by Manoel Leal on 15/11/22.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    
    var email = ""
    var name = ""
    var password = ""
    
    @Published var formInvalid = false
    var alertText = ""
    
    @Published var isLoading = false
    
    func signUp(){
        self.isLoading = true
        print("email: \(email), senha: \(password)")
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            guard let user = result?.user, error == nil else {
                self.formInvalid = true
                self.alertText = error!.localizedDescription
                print(error)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("Usuario criado \(user.uid)")
        }
    }
}
