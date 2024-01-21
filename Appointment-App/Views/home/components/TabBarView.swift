//
//  TabBarView.swift
//  Appointment-App
//
//  Created by Fatih Can on 21.01.2024.
//

import SwiftUI

struct HorizontalTabBar: View {
    var tabs: [String]
    @Binding var selectedIndex: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                }) {
                    VStack {
                        Text(tabs[index])
                            .font(.headline)
                            .foregroundColor(index == selectedIndex ? .royalBlue : .gray)
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(index == selectedIndex ? .royalBlue : .clear).frame(width:  70 )
                    }
                }
               
            }
            
        }
        
    }
}

struct ContentView: View {
    @State private var selectedTab = 0
    let tabItems = ["Upcoming", "Past"]

    var body: some View {
        VStack {
            HorizontalTabBar(tabs: tabItems, selectedIndex: $selectedTab)
                .padding(.top, 20)
            
            Text("Selected Tab: \(tabItems[selectedTab])")
                .font(.title)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
