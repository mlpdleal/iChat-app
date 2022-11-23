//
//  ChatViewModel.swift
//  iChat
//
//  Created by Manoel Leal on 18/11/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ChatViewModel: ObservableObject {
    
    @Published var messages: [Message] = []
    
    @Published var text = ""
    
    func onAppear(toId: String){
        let fromId = Auth.auth().currentUser!.uid
        
        Firestore.firestore().collection("conversations")
            .document(fromId)
            .collection(toId)
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error: Fetching documents \(error)")
                    return
                }
                
                if let changes = querySnapshot?.documentChanges {
                    for doc in changes {
                        let document = doc.document
                        print("Document is: \(document.documentID) \(document.data())")
                        
                        let message = Message(uuid: document.documentID, text: document.data()["text"] as! String, isMe: fromId == document.data()["fromId"] as! String)
                        
                        self.messages.append(message)
                    }
                }
            }
    }
    
    func sendMessage(toId: String){
        let fromId = Auth.auth().currentUser!.uid
        let timestamp = Date().timeIntervalSince1970
        
        Firestore.firestore().collection("conversations")
            .document(fromId)
            .collection(toId)
            .addDocument(data: [
                "text": text,
                "fromId": fromId,
                "toId": toId,
                "timestamp": UInt(timestamp)
            ]) { err in
                if err != nil {
                    print("ERROR: \(err!.localizedDescription)")
                    return
                }
            }
        
        Firestore.firestore().collection("conversations")
            .document(toId)
            .collection(fromId)
            .addDocument(data: [
                "text": text,
                "fromId": fromId,
                "toId": toId,
                "timestamp": UInt(timestamp)
            ]) { err in
                if err != nil {
                    print("ERROR: \(err!.localizedDescription)")
                    return
                }
            }
        
    }
    
}
