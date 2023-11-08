//
//  IssuedBooksViewModel.swift
//  Library
//
//  Created by Sanjeev Bharti on 11/8/23.
//

import Foundation

class IssuedBooksViewModel: ObservableObject {

    @Published var issuedBooks: [Book] = []
    @Published var showError = false

    
    func fetchIssuedBooks() {
        Task {
            do {
                let response = try await API.booksIssuedForStudent()
                DispatchQueue.main.async {
                    self.issuedBooks = response
                }
            } catch {
                DispatchQueue.main.async {
                    print("Error:", (error as? CustomError)?.description ?? "")
                    self.showError = true
                }
            }
            
        }
    }
}
