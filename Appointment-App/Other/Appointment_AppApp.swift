//
//  Appointment_AppApp.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//
import FirebaseCore
import SwiftUI

@main
struct Appointment_AppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
