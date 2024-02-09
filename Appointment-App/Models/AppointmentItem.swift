//
//  AppointmentItem.swift
//  Appointment-App
//
//  Created by Fatih Can on 28.01.2024.
//

import Foundation

struct AppointmentItem: Codable, Identifiable {
    let id: String
    let clinicCategory: String
    let doctorName: String
    let complaint: String
    let appointmentDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
