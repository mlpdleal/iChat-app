//
//  ContentView.swift
//  iChat
//
//  Created by Manoel Leal on 17/11/22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack{
            if viewModel.isLogged {
                MessagesView()
            } else {
                SignInView()
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
