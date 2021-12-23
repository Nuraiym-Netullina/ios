//
//  HomeView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
            VStack(alignment: .center, spacing: 32){
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 160, weight: .medium))
                    .foregroundColor(.gray)
                VStack(alignment: .center, spacing: 16){
                    Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
                    Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                    Text("Occupation: \(sessionService.userDetails?.occupation ?? "N/A")")
                }
                Spacer()
                ButtonView(title: "Logout"){
                    sessionService.logout()
                }
                Spacer()
            }
        .padding(.horizontal, 15)
        .navigationBarTitle("Main ContentView")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
