//
//  ContentView.swift
//  Library
//
//  Created by Sanjeev Bharti on 11/8/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        
        NavigationView(content: {
            
            ZStack(content: {
                
                VStack(alignment: .leading, spacing: 20.0) {
                    
                    textFieldViewWith(header: "Username")
                    textFieldViewWith(header: "Password", isSecure: true)
                    
                    if viewModel.showError {
                        Text("Note: For Successful login use below credentials: \nusername: sanjeev\nPassword: Vidrohi")
                            .fontWeight(.medium)
                            .foregroundStyle(.cyan)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.login()
                    }, label: {
                        Text("Login")
                            .foregroundStyle(.black)
                            .fontWeight(.medium)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8.0)
                                    .stroke(.black, lineWidth: 1.0)
                            }
                    })
                    .sheet(isPresented: $viewModel.showIssuedBooksPage, content: {
                        IssuedBooksView(viewModel: IssuedBooksViewModel())
                    })
                }
                .blur(radius: viewModel.showLoader ? 3.0 : 0.0)
                .disabled(viewModel.showLoader)
                
                if viewModel.showLoader {
                    ProgressView()
                }
                
            })
            .padding()
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
        })
    }
    
    
    private func textFieldViewWith(header: String, isSecure: Bool = false) -> some View {
        VStack(alignment: .leading) {
            Text(header).font(.footnote).fontWeight(.medium).foregroundStyle(.secondary)
            if isSecure {
                SecureField("password", text: $viewModel.password)
            } else {
                TextField("username", text: $viewModel.username)
            }
            Divider()
        }
        
    }
    
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
