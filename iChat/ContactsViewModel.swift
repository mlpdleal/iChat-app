//
//  ContactsViewModel.swift
//  iChat
//
//  Created by Manoel Leal on 17/11/22.
//

import Foundation
import FirebaseFirestore

class ContactsViewModel: ObservableObject {
    
    @Published var contacts: [Contact] = []
    
    func getContacts() {
        Firestore.firestore().collection("users")
            .getDocuments{ querySnapshot, error in
                if let error = error {
                    print("Erro ao buscar contatos: \(error)")
                    return
                }
                
                for document in querySnapshot!.documents {
                    print("ID \(document.documentID) \(document.data())")
                    self.contacts.append(Contact(uuid: document.documentID,
                                            name: document.data()["name"] as! String,
                                            profileUrl: document.data()["profileUrl"] as! String))
                }
            }
    }
}
