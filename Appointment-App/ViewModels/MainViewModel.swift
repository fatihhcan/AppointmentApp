//
//  MainViewModel.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    @Published var selectedTab: Tab = .home

    enum Tab {
        case home, appointment, profile, support
    }
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    
}
