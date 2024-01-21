//
//  LoginView.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(
                    title: Strings.welcomeBack.rawValue)
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                    
                }
                VStack{
                    HStack{
                        Text(Strings.login.rawValue)
                            .font(.system(size: FontSizes.body2))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Spacer()
                    }
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
                    Spacer().frame(height: 45)
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
                    Spacer().frame(height: 62)
                    CustomButton(
                        title: Strings.login.rawValue,
                        backgroundColor: .royalBlue, titleColor: Color.white, fontSize: FontSizes.button1,
                        
                        action: {
                        viewModel.login()
                    }).frame(width: ViewWidth.CustomButton, height: ViewHeight.CustomButton)
                    
                    NavigationLink(Strings.createAccount.rawValue, destination: RegisterView()).foregroundColor(Color.royalBlue)
                        .bold()
                        .font(.system(size: FontSizes.button1))
                    Spacer()
                }.padding(EdgeInsets.paddingVertical)
                Spacer()
                
                
            }.padding(EdgeInsets.paddingHorizontal).ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
