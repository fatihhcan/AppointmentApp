//
//  ContentView.swift
//  Appointment-App
//
//  Created by Fatih Can on 20.01.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView(selection: $viewModel.selectedTab) {
                    HomeView()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                        .tag(MainViewModel.Tab.home)

                    //Create an appointment view
//                        .tabItem {
//                            Label("", systemImage: "appointment")
//                        }
//                        .tag(MainViewModel.Tab.appointment)

                    //Profile View
//                        .tabItem {
//                            Label("", systemImage: "Profile")
//                        }
//                        .tag(MainViewModel.Tab.Profile)

                    //Support View
//                        .tabItem {
//                            Label("", systemImage: "Support")
//                        }
//                        .tag(MainViewModel.Tab.Support)
                }
                .environmentObject(viewModel)
            }

    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().ignoresSafeArea()
    }
}
