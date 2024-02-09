//
//  AppointmentCard.swift
//  Appointment-App
//
//  Created by Fatih Can on 21.01.2024.
//

import SwiftUI

struct AppointmentCard: View {
    let title: String
    let date: String
    let clock: String
    let doctorName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(width: ViewWidth.CardItem, height: ViewHeight.CardItem)
            .shadow(color: .gray, radius: 5, x: 0, y: 5) // Shadow adjusted for visibility

            // VStack ile içeride üç adet metin ekleyebilirsiniz.
            .overlay(
                VStack(spacing: 8) {
                    Spacer()
                    Image(Images.imgDoctor.rawValue)
                    Spacer()
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .font(.system(size: FontSizes.subtitle1))
                    
                    Text("\(date) - \(clock)")
                        .font(.subheadline)
                        .foregroundColor(.silver)
                        .fontWeight(.semibold)
                        .font(.system(size: FontSizes.subtitle2))
                    
                    Text(doctorName)
                        .font(.subheadline)
                        .foregroundColor(.royalBlue)
                        .fontWeight(.bold)
                        .font(.system(size: FontSizes.body2))
                    Spacer()
                }
                .padding()
            )
    }
}

struct AppointmentCard_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentCard(title: "Dietitian", date: "25 October", clock: "03:00 PM", doctorName: "Dr.Agatha Wilson")
    }
}
