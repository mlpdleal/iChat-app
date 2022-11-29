//
//  ChatView.swift
//  iChat
//
//  Created by Manoel Leal on 18/11/22.
//

import SwiftUI

struct ChatView: View {
    
    let contact: Contact
    @StateObject var viewModel = ChatViewModel()
    
    @State var textSize: CGSize = .zero
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false){
                ForEach(viewModel.messages, id: \.self) { message in
                    messageRow(message: message)
                }
            }
            
            Spacer()
            
            HStack {
                ZStack{
                    TextEditor(text: $viewModel.text)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .background(.white)
                        .cornerRadius(24.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24.0)
                                .strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0))
                        )
                        .frame(maxHeight: (textSize.height + 50) > 100 ? 100 : textSize.height + 50)
                    
                    // text field falso, o texto real e escrito sobre o texto abaixo, mas como o texto abaixo e
                    //   transparente nao e possivel ve-lo, o objetivo da instrucao abaixo e apenas alinhar
                    
                    Text(viewModel.text)
                        .opacity(0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(ViewGeometry())
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 21)
                        .onPreferenceChange(ViewSizeKey.self) { size in
                            textSize = size
                        }
                }
                
                Button {
                    viewModel.sendMessage(contact: contact)
                    //viewModel.text = ""
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
        .navigationTitle(contact.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.onAppear(contact: contact)
        }
    }
}

struct ViewGeometry: View {
    var body: some View{
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewSizeKey.self, value: geometry.size)
        }
    }
}

struct ViewSizeKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        print("new value is \(value)")
        value = nextValue()
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
        ChatView(contact: Contact(uuid: UUID().uuidString, name: "Pessoa teste", profileUrl: ""))
    }
}
