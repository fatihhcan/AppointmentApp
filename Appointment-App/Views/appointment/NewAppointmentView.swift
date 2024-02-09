//
//  NewAppointmentView.swift
//  Appointment-App
//
//  Created by Fatih Can on 22.01.2024.
//

import SwiftUI

struct NewAppointmentView: View {
    @StateObject var viewModel = NewAppointmentViewModel()
    @Binding var newItemPresented: Bool
    @State private var selection = "DR."
    @State private var selectedCategory: String?
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(viewModel.clinics, id: \.self) { clinic in
                        ClinicCategory(
                            title: clinic, icon: Images.icDietitian.rawValue, action: {
                            viewModel.clinicCategory = clinic
                        })
                                }
                              
                }.padding()
                
            }  .onAppear {
                viewModel.fetchClinics()
            }
            Picker("Select a doctor", selection: $selection) {
                
                ForEach(viewModel.doctors, id: \.self) { doctor in
                   
                               Text(doctor)
                           }
                       }.accentColor(.royalBlue)
                .pickerStyle(.menu).onChange(of: selection) { newValue in
                    viewModel.doctorName = newValue
                }.onAppear {
                    viewModel.fetchDoctors()
                }
            Text("Selected doctor: \(selection)")
                   
            Form{
                TextField("Complaint", text: $viewModel.complaint)
                    .textFieldStyle(DefaultTextFieldStyle()).frame(height: ViewHeight.CustomButton).accentColor(.royalBlue)
                
                DatePicker("Appointment Date", selection: $viewModel.appointmentDate)
                    .accentColor(.royalBlue)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                CustomButton(title: "Create an appointment", backgroundColor: .royalBlue, titleColor: .white, fontSize: FontSizes.button1) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                        
                    } else {
                        viewModel.showAlert = true
                    }
                }.frame( height: ViewHeight.CustomButton)
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select appointment date that is today or newer."))
            }
            
        }
    }
}

struct NewAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAppointmentView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
