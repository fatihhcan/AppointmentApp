//
//  Underline.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//

import Foundation
import SwiftUI

extension View {
    func underlineTextField() -> some View {
        self
            .overlay(Rectangle().frame(height: 1).padding(.top, 35))
            .foregroundColor(Color.silver)
           
    }
}
