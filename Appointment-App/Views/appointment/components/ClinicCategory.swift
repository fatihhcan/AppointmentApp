//
//  ClinicCategory.swift
//  Appointment-App
//
//  Created by Fatih Can on 22.01.2024.
//

import SwiftUI

struct ClinicCategory: View {
    @State private var isButtonTapped = false
    let title: String
    let icon: String
    let action: () -> Void
    var body: some View {

        Button(action: {
            action()
            isButtonTapped.toggle()
                }) {
                    HStack {
                        Image(icon)
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .background(
                             RoundedRectangle(cornerRadius: 10)
                                 .stroke(isButtonTapped ? Color.royalBlue : Color.gray, lineWidth: 2)
                         )
                }
                .padding() 
    }
    
}

struct ClinicCategory_Previews: PreviewProvider {
    static var previews: some View {
        ClinicCategory(title: "Dentistry", icon: Images.icDietitian.rawValue){}
    }
}
