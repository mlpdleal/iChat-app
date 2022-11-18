//
//  ChatView.swift
//  iChat
//
//  Created by Manoel Leal on 18/11/22.
//

import SwiftUI

struct ChatView: View {
    
    let username: String
    @StateObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false){
                ForEach(viewModel.messages, id: \.self) { message in
                    messageRow(message: message)
                }
            }
            
            Spacer()
            
            HStack {
                TextField("Digite a mensagem", text: $viewModel.text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(.white)
                    .cornerRadius(24.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24.0)
                            .strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0))
                    )
                
                Button {
                    
                } label: {
                    Text("Enviar")
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(.white)
                        .cornerRadius(24.0)
                }
                .disabled(viewModel.text.isEmpty)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
        }
        .navigationTitle(username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct messageRow: View {
    
    let message: Message
    
    var body: some View{
        Text(message.text)
            .background(Color(white: 0.95))
            .frame(maxWidth: .infinity, alignment: message.isMe ? .leading : .trailing)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.leading, message.isMe ? 0 : 50)
            .padding(.trailing, message.isMe ? 50 : 0)
            .padding(.vertical, 5)
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(username: "Test")
    }
}
