//
//  Protection3App.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI
import Firebase

@main
struct Protection3App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionServiceImpl()
    init() {
           FirebaseApp.configure()
        }
    let persistentContainer = CoreDataManager.shared.persistentContainer
        
        var body: some Scene {
            WindowGroup {
                NavigationView{
                    switch sessionService.state {
                    case.loggedIn:
                        MainView()
                            .environmentObject(sessionService)
                    case.loggedOut:
                        LoginView()
                    }
                }
                
            }
        }
    }

final class AppDelegate: NSObject, UIApplicationDelegate {
     private func application(_ application: UIApplication,
                     didFinishLaunchngWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
