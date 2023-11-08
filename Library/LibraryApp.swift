//
//  LibraryApp.swift
//  Library
//
//  Created by Sanjeev Bharti on 11/8/23.
//

import SwiftUI

@main
struct LibraryApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
