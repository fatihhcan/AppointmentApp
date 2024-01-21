//
//  RegisterView.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    var body: some View {
        VStack{
            HeaderView(
                title: Strings.welcome.rawValue)
            
            VStack{
                HStack{
                    Text(Strings.register.rawValue)
                        .font(.system(size: FontSizes.body2))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                HStack{
                    Image(Images.icProfile.rawValue)
                    Text(Strings.fullName.rawValue)
                        .font(.system(size: FontSizes.body1))
                        .foregroundColor(.silver)
                        .fontWeight(.semibold)
                    Spacer()
                }
                TextField(Strings.fullNamePlaceHolder.rawValue, text: $viewModel.name)
                    .underlineTextField()
                Spacer().frame(height: 24)
                HStack{
                    Image(Images.icEmail.rawValue)
                    Text(Strings.email.rawValue)
                        .font(.system(size: FontSizes.body1))
                        .foregroundColor(.silver)
                        .fontWeight(.semibold)
                    Spacer()
                }
                TextField(Strings.emailPlaceHolder.rawValue, text: $viewModel.email)
                    .underlineTextField()
                Spacer().frame(height: 24)
                HStack{
                    Image(Images.icPassword.rawValue)
                    Text(Strings.password.rawValue)
                        .font(.system(size: FontSizes.body1))
                        .foregroundColor(.silver)
                        .fontWeight(.semibold)
                    Spacer()
                }
                SecureField(Strings.passwordPlaceHolder.rawValue, text: $viewModel.password)
                    .underlineTextField()
                
                
                
                
            }.padding(EdgeInsets.paddingVertical)
            Spacer().frame(height: 101)
            
            CustomButton(
                title: Strings.register.rawValue,
                backgroundColor: .royalBlue, titleColor: Color.white, fontSize: FontSizes.button1,
                
                action: {
                    viewModel.register()
                }).frame(width: ViewWidth.CustomButton, height: ViewHeight.CustomButton)
        }.padding(EdgeInsets.paddingHorizontal).navigationBarBackButtonHidden(true).ignoresSafeArea()
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().ignoresSafeArea()
    }
}
