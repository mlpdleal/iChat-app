//
//  MessagesView.swift
//  iChat
//
//  Created by Manoel Leal on 17/11/22.
//

import SwiftUI

struct MessagesView: View {
    
    @StateObject var viewModel = MessagesViewModel()
    
    var body: some View {
        Button{
            viewModel.logout()
        } label: {
            Text("Logout")
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
