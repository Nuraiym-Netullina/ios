//
//  RegistrationDetails.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import Foundation

struct RegistrationDetails {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var occupation: String
}

extension RegistrationDetails {
    static var new: RegistrationDetails {
        RegistrationDetails(email: "",
                            password: "",
                            firstName: "",
                            lastName: "",
                            occupation: "")
    }
}
