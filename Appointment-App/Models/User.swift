//
//  User.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
