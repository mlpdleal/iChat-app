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
        NavigationView{
            VStack{
                if viewModel.isLoading {
                    ProgressView()
                }
                
                List(viewModel.contacts, id: \.self){ contact in
                    NavigationLink{
                        ChatView(contact: contact)
                    } label: {
                        ContactMessageRow(contact: contact)
                    }
                }
            }
            .onAppear {
                viewModel.getContacts()
            }
            .navigationTitle("Messages")
            .toolbar{
                
                ToolbarItem(id: "Logout",
                            placement: ToolbarItemPlacement.navigationBarTrailing,
                            showsByDefault: true) {
                    Button{
                        viewModel.logout()
                    } label: {
                        Text("Logout")
                    }
                }
                
                ToolbarItem(id: "Contacts",
                            placement: ToolbarItemPlacement.navigationBarLeading,
                            showsByDefault: true) {
                    NavigationLink("Contatos", destination: ContactsView())
                }
          

            }
        }
        
 
    }
}

struct ContactMessageRow: View {
    
    var contact: Contact
    
    var body: some View{
        HStack{
            AsyncImage(url: URL(string: contact.profileUrl)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            VStack{
                Text(contact.name)
                if let msg = contact.lastMessage {
                    Text(msg)
                        .lineLimit(1)
                }
            }
            Spacer()
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
