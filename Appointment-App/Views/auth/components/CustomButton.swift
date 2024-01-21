//
//  CustomButton.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let backgroundColor: Color
    let titleColor: Color
    let fontSize: Double
    let action: () -> Void
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(titleColor)
                    .bold()
                    .font(.system(size: fontSize))
            }
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(
            title: "title",
            backgroundColor: Color.royalBlue,
            titleColor: Color.white,
            fontSize: 16
        ){}
    }
}
