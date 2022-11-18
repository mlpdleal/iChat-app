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
                
            }
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

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
