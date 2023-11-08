//
//  IssuedBooksView.swift
//  Library
//
//  Created by Sanjeev Bharti on 11/8/23.
//

import SwiftUI

struct IssuedBooksView: View {
    
    @ObservedObject var viewModel: IssuedBooksViewModel
    
    var body: some View {
        
        NavigationView(content: {
            ZStack {
                
                if (viewModel.showError == false) {
                    List(viewModel.issuedBooks, id: \.self) { book in
                        Text(book.rawValue)
                            .padding(.vertical, 5.0)
                    }
                    .blur(radius: viewModel.issuedBooks.count <= 0 ? 3.0 : 0.0)
                    .disabled(viewModel.issuedBooks.count <= 0)
                }
                
                if viewModel.showError {
                    Button(action: {
                        viewModel.fetchIssuedBooks()
                    }, label: {
                        Text("Retry")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                
                if viewModel.issuedBooks.count <= 0, viewModel.showError == false {
                    ProgressView()
                }
            }
            .navigationTitle("Issued Books")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible)
            .onAppear(perform: {
                viewModel.fetchIssuedBooks()
            })
        })
    }
    
}

#Preview {
    IssuedBooksView(viewModel: IssuedBooksViewModel())
}
