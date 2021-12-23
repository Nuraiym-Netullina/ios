//
//  LoginView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false
    
    @StateObject private var vm = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View {
        VStack(spacing: 16){
            VStack(spacing: 16){
                InputTextFieldView(text: $vm.credentials.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope")
                
                InputPasswordView(password: $vm.credentials.password,
                                   placeholder: "Password",
                                   sfSymbol: "lock")
            }
            
            VStack(spacing: 16){
                
                ButtonView(title: "Login"){
                    vm.login()
                }
                ButtonView(title: "Register",
                           background: .clear,
                           foreground: .blue,
                           border: .blue){
                    showRegistration.toggle()
                }
                
                           .sheet(isPresented: $showRegistration,
                                  content: {
                               RegisterView()
                           })
            }
        }
        .padding(.horizontal, 15)
        .navigationBarTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
