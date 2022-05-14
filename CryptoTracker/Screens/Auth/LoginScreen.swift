//
//  LoginScreen.swift
//  CryptoTracker
//
//  Created by Oriakhi Collins on 5/2/22.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var model = LoginViewModel(service: AuthService())
    var body: some View {
        NavigationView {
            VStack{
            
                Image(systemName: "lock.shield")
                    .font(.custom("", size: 100))
                    .foregroundColor(Color.theme.green)

                ZStack(alignment: .topLeading){
                    emailHintText
                        .padding()
                    TextField("", text: $model.email)
                        .padding()
                    
                }
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.gray).opacity(0.5))
                .font(.body)
                
                
                ZStack(alignment: .topLeading){
                    passwordHintText
                        .padding()
                    SecureField("", text: $model.password)
                        .padding()
                    
                }
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.gray).opacity(0.5))
                .font(.body)
                
                
                Text("Forgot Password?")
                
                Text("Don't have an account? Register")
                
                Spacer()

                buildButton
              
                    
                    
                    .navigationTitle("Login")
            }
            .disabled(model.isLoading)
            .alert(isPresented: $model.hasError, content: {
                Alert(title: Text("No Internet"), message:  Text("Please make sure your credentaials are correct, and try again"), dismissButton: .cancel())
            })
            .overlay(VStack {
                
            })
            .padding()
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}


extension LoginScreen {
   private  var buildButton: some View {
    VStack {
        if model.isLoading {
            ProgressView ()
        }
       
        else {
            Button(action: {
                     model.login()
                 }, label: {
                     Text("Login")
                         .frame(width: 280 , height: 43)
                         .background(Color.theme.green)
                         .cornerRadius(20)
                 })
        }
        
    }
    }
    
    
    private var emailHintText: some View {
        ZStack {
            if model.email.isEmpty {
                Text("Email")
            }
            else {
                Text("")
            
            }
        }
    }
    
    
    private var passwordHintText: some View {
        ZStack {
            if model.password.isEmpty {
                Text("Password")
            }
            else {
                Text("")
                
            }
        }
    }
}
