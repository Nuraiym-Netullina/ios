//
//  UserDetailsView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI
import Kingfisher


struct UserDetails: Decodable {
    let username, firstName, lastName, profileImage: String
}

class UserDetailsViewModel: ObservableObject {
    
    @Published var userDetails: UserDetails?
    
    init(userId: Int) {
        
        guard let url = URL(string: "") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                
                do {
                    self.userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                } catch let jsonError {
                    print("Decoding failed for UserDetails:", jsonError)
                }
                print(data)
            }
            
        }.resume()
    }
    
}

struct UserDetailsView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    @ObservedObject var vm: UserDetailsViewModel
    
    let user: User
    
    init(user: User) {
        self.user = user
        self.vm = .init(userId: user.id)
    }
    
    var body: some View {
            VStack(spacing: 16) {
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .clipShape(Circle())
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(user.name)
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                Text(user.description)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.blue)
                Spacer()
                ButtonView(title: "Send message"){}
                Spacer()
                
            }.padding(.horizontal, 15)
             .navigationBarTitle(user.name, displayMode: .inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProtectionView()
        
        NavigationView {
            UserDetailsView(user: .init(id: 0, name: "Ellen", imageName: "Ellen", description: "Hey! My name is Ellen. I am a volunteer. I help animals with housing, food and pay checks."))
        }
    }
}


