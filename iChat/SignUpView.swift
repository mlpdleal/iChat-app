//
//  SignUpView.swift
//  iChat
//
//  Created by Manoel Leal on 15/11/22.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            Image("chat_logo")
                .resizable()
                .scaledToFit()
                .padding()
            
            TextField("Entre com seu e-mail", text: $viewModel.email)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(.white)
                .cornerRadius(24.0)
                .overlay{
                    RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(.separator), style: StrokeStyle(lineWidth: 1.0))
                }
                .padding(.bottom, 20)
            
            TextField("Entre com seu nome", text: $viewModel.name)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(.white)
                .cornerRadius(24.0)
                .overlay{
                    RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(.separator), style: StrokeStyle(lineWidth: 1.0))
                }
                .padding(.bottom, 20)
            
            SecureField("Entre com sua senha", text: $viewModel.password)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(.white)
                .cornerRadius(24.0)
                .overlay{
                    RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(.separator), style: StrokeStyle(lineWidth: 1.0))
                }
                .padding(.bottom, 20)
            
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
            
            Button{
                viewModel.signUp()
            } label: {
                Text("Cadastrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("GreenColor"))
                    .foregroundColor(.white)
                    .cornerRadius(24.0)
                    
            }
            .alert(isPresented: $viewModel.formInvalid){
                Alert(title: Text(viewModel.alertText))
            }
            
  
              
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
        .background(Color.init(red: 240 / 255, green: 231 / 255, blue: 210 / 255))
        .navigationBarTitleDisplayMode(.inline)
      
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
