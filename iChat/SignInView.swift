//
//  ContentView.swift
//  iChat
//
//  Created by Manoel Leal on 03/10/22.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel = SignInViewModel()
    
    var body: some View {
        
        NavigationView{
            
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
                
                
                
                Button{
                    viewModel.signIn()
                } label: {
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("GreenColor"))
                            .foregroundColor(.white)
                            .cornerRadius(24.0)
                    } else {
                        Text("Entrar")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("GreenColor"))
                            .foregroundColor(.white)
                            .cornerRadius(24.0)
                    }
                    
                }
                .alert(isPresented: $viewModel.formInvalid){
                    Alert(title: Text(viewModel.alertText))
                }
                
                Divider()
                    .padding()
                
                NavigationLink(destination: SignUpView()) {
                    Text("Nao tem uma conta? Clique aqui")
                        .foregroundColor(.black)
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.init(red: 240 / 255, green: 231 / 255, blue: 210 / 255))
            .navigationTitle("Login")
            .navigationBarHidden(true)
            
        }
      
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
