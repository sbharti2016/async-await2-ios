//
//  LoginViewModel.swift
//  Library
//
//  Created by Sanjeev Bharti on 11/8/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var username = "Sanj"
    @Published var password = "Vidrohi"
    
    @Published var showError = false
    
    @Published var showIssuedBooksPage = false
    @Published var showLoader = false
    
    func login() {
        showLoader = true
        Task {
            
            do {
                let response = try await API.loginWith(username:username, password:password)
                DispatchQueue.main.async {
                    self.showIssuedBooksPage = response
                    self.showLoader = false
                }
            } catch {
                print("Error:", (error as? CustomError)?.description ?? "")
                DispatchQueue.main.async {
                    self.showError = true
                    self.showLoader = false
                }
            }
        }
    }
}


