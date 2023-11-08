//
//  API.swift
//  Library
//
//  Created by Sanjeev Bharti on 11/8/23.
//

import Foundation

// Data Source
enum Book: String, CaseIterable {
    case math = "Mathematics"
    case science = "Science"
    case environment = "Environment"
    case hindi = "Hindi"
}

enum CustomError: Error {
    case login
    case reissueBook
    
    var description: String {
        switch self {
        case .login: return "Please check entered username or password"
        case .reissueBook: return "Error occured while re-issuing books"
        }
    }
}

class API {
    
    static func loginWith(username: String, password: String) async throws -> Bool {
        // Mimic server response
        let variableAPICallingTime = UInt32.random(in: 1 ... 3)
        sleep(variableAPICallingTime)
        
        if username.caseInsensitiveCompare("Sanjeev") == .orderedSame && password == "Vidrohi" {
            return true
        } else {
            throw CustomError.login
        }
    }
    
    static func booksIssuedForStudent() async throws -> [Book] {
        // Mimic server response
        let variableAPICallingTime = UInt32.random(in: 1 ... 4)
        print("fetching books will take: \(variableAPICallingTime) seconds")
        sleep(variableAPICallingTime)

        // throw error if variableAPICallingTime > 3
        
        if variableAPICallingTime > 3 {
            throw CustomError.reissueBook
        }
        return Book.allCases
    }
    
}
