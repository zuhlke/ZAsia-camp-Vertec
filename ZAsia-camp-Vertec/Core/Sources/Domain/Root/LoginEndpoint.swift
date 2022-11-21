//
//  File.swift
//  
//
//  Created by Eugene Tan on 21/11/22.
//

import Foundation
import Support

struct LoginEndpoints {
    var logIn: LoginEndpoint {
        .init()
    }
}

struct LoginEndpoint: HTTPEndpoint {
    
    struct Input: Codable {
        var username: String
        var password: String
    }
    
    func request(for input: Input) throws -> HTTPRequest {
        try .post("/login", body: .json(input))
    }
    
    func parse(_ response: HTTPResponse) throws -> Void {
        
    }
    
}
