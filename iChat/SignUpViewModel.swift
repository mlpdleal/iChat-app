//
//  SignUpViewModel.swift
//  iChat
//
//  Created by Manoel Leal on 15/11/22.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var image = UIImage()
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    
    @Published var formInvalid = false
    var alertText = ""
    
    @Published var isLoading = false
    
    func signUp(){
       
        print("email: \(email), senha: \(password)")
        
        if (image.size.width <= 0){
            formInvalid = true
            alertText = "Selecione uma foto"
            return
        }
        
        self.isLoading = true
        
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
            
            self.uploadPhoto()
        }
    }
    
    func uploadPhoto(){
        let filename = UUID().uuidString
        
        guard let data = image.jpegData(compressionQuality: 0.2) else { return }
        
        let newMetadata = StorageMetadata()
        newMetadata.contentType = "image/jpeg"
        
        let reference = Storage.storage().reference(withPath: "/images/\(filename).jpg")
        
        reference.putData(data, metadata: newMetadata) { metadata, err in
            reference.downloadURL { url, error in
                self.isLoading = false
                guard let url = url else { return }
                print("Foto criada \(url)")
                self.createUser(photoUrl: url)
            }
        }
    }
    
    private func createUser(photoUrl: URL){
        Firestore.firestore()
            .collection("users")
            .document()
            .setData([
                "name": name,
                "uuid": Auth.auth().currentUser!.uid,
                "profileUrl": photoUrl.absoluteString
            ]) { error in
                self.isLoading = false
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
            }
    }
}
