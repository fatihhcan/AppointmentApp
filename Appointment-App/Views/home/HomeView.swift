//
//  HomeView.swift
//  Appointment-App
//
//  Created by Fatih Can on 21.01.2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    let tabItems = ["Upcoming", "Past"]
    @StateObject var viewModel: HomeViewModel
    @FirestoreQuery var items: [AppointmentItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/appointments")
        self._viewModel = StateObject(wrappedValue: HomeViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height: 80)
                HStack {
                        Text("Welcome to You,")
                            .font(.system(size: FontSizes.headline2))
                            .foregroundColor(Color.black)
                            .bold()
                        Spacer()
                    }
                HStack {
                       Text("Fatih")
                           .font(.system(size: FontSizes.headline2))
                           .foregroundColor(Color.royalBlue)
                           .bold()
                       Spacer()
                   }
                
                Spacer()
                CustomButton(
                    title: Strings.createAnAppointment.rawValue,
                    backgroundColor: .pictonBlue, titleColor: Color.white, fontSize: FontSizes.subtitle2,
                    
                    action: {
                        viewModel.showingNewAppointmentView = true
                }).frame(width: ViewWidth.CustomButton, height: ViewHeight.CreateAppointmentButton)
                Spacer()
                HStack{
                    HorizontalTabBar(tabs: tabItems, selectedIndex: $selectedTab)
                    Spacer()
                }
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(0..<3) { index in
                                    AppointmentCard(title: "Dietitian", date: "25 October", clock: "03:00 PM", doctorName: "Dr.Agatha Wilson")
                                
                                }
                            }
                            .padding(5)
                        }
                Spacer()
            }.sheet(isPresented: $viewModel.showingNewAppointmentView){
                NewAppointmentView(newItemPresented: $viewModel.showingNewAppointmentView)
            }
            .padding(EdgeInsets.paddingHorizontalHome )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userId: "E3zwlGPk8JfoSBaPCBpWwM6woPq2")
    }
}
