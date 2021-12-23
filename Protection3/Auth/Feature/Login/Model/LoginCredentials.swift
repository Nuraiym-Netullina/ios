//
//  LoginCredentials.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 22.12.2021.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials {
    
    static var new: LoginCredentials {
        LoginCredentials(email: "", password: "")
    }
}
