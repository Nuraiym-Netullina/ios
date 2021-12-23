//
//  MainView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 22.12.2021.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @State private var selection = 0
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some View {
        
        TabView(selection: $selection){
            ProtectionView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                .tag(0)
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
                .tabItem {
                    VStack {
                        Image(systemName: "square.and.pencil")
                        Text("Diary")
                    }
                }
                .tag(1)
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.square")
                        Text("Profile")
                    }
                }
                .tag(2)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
