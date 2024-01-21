//
//  HeaderView.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    var body: some View {
        ZStack{
            Image(Images.imgHeader.rawValue).resizable().aspectRatio(contentMode: .fill)
                
            VStack{
                Spacer().frame(height: 20)
                Text(title)
                    .font(.system(size: FontSizes.headline1))
                    .foregroundColor(Color.white)
                    .bold()
                    
            }
            .padding(EdgeInsets.paddingTopHeader)
            
        }.frame(width: UIScreen.main.bounds.width, height: ViewHeight.HeaderImg)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title")
    }
}
