//
//  NewAppointmentViewModel.swift
//  Appointment-App
//
//  Created by Fatih Can on 28.01.2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewAppointmentViewModel: ObservableObject {
    @Published var clinicCategory = ""
    @Published var doctorName = ""
    @Published var complaint = ""
    @Published var appointmentDate = Date()
    @Published var showAlert = false
    @Published var isButtonTapped = false
    @Published var clinics: [String] = []
    @Published var doctors: [String] = []
    
    init(){}
    
    func save() {
        guard canSave else {
            return
        }
        //get current user uid
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //create model
        let newId = UUID().uuidString
        let newItem = AppointmentItem(
            id: newId,
            clinicCategory: clinicCategory,
            doctorName: doctorName,
            complaint: complaint,
            appointmentDate: Date().timeIntervalSince1970,
            isDone: false)
        
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("appointments")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !complaint.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard appointmentDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    func fetchClinics() {
        
        let db = Firestore.firestore()
        db.collection("clinics").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    if let clinicName = document["title"] as? String {
                        self.clinics.append(clinicName)
                    }
                }
            }
        }
    }
    
    func fetchDoctors() {
        
        let db = Firestore.firestore()
        db.collection("doctors").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    if let drName = document["name"] as? String {
                        self.doctors.append(drName)
                    }
                }
            }
        }
    }
}

