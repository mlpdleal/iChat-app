//
//  ChatViewModel.swift
//  iChat
//
//  Created by Manoel Leal on 18/11/22.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messages: [Message] = [
        Message(uuid: UUID().uuidString, text: "some message", isMe: false),
        Message(uuid: UUID().uuidString, text: "Another message", isMe: false),
        Message(uuid: UUID().uuidString, text: "Message for test", isMe: true),
        Message(uuid: UUID().uuidString, text: "some message", isMe: false),
        Message(uuid: UUID().uuidString, text: "My message", isMe: true),
        Message(uuid: UUID().uuidString, text: "To a contact", isMe: true),
        Message(uuid: UUID().uuidString, text: "for test", isMe: true),
        Message(uuid: UUID().uuidString, text: "With them", isMe: false),
        Message(uuid: UUID().uuidString, text: "receive that", isMe: false)
    ]
    
    @Published var text = ""
    
    
}
