//
//  main.swift
//  Delegate and Protocols
//
//  Created by Arman Myrzakanurov on 15.05.2022.
//

import Foundation


protocol AdvancedLifeSupport: AnyObject {
    func performCPR()
}

class EmergencyHandler {
    
    weak var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func emergencyCall() {
        delegate?.performCPR()
    }
}

class Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Paramedic do chest compression for 30 sec.")
    }
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyHandler) {
        handler.delegate = self
    }
    
    func givePills() {
        print("Take some Pills")
    }
    
    func performCPR() {
        print("Doctor do chest compression for 30 sec.")
    }
}

class Surgeon: Doctor {
    
    override func performCPR() {
        super.performCPR()
        print("Signing staying alive!")
    }
}

let emilio = EmergencyHandler()
//let pete = Paramedic(handler: emilio)
//let steve = Doctor(handler: emilio)
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.emergencyCall()
