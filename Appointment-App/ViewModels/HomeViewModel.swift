//
//  HomeViewModel.swift
//  Appointment-App
//
//  Created by Fatih Can on 28.01.2024.
//
import FirebaseFirestore
import Foundation

class HomeViewModel: ObservableObject {
    @Published var showingNewAppointmentView = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    //delete to do list item
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("appointments")
            .document(id)
            .delete()
    }
}
