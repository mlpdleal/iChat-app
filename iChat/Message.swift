//
//  Message.swift
//  iChat
//
//  Created by Manoel Leal on 18/11/22.
//

import Foundation

struct Message: Hashable {
    let uuid: String
    let text: String
    let isMe: Bool
}
