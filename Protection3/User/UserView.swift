//
//  UserView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI

struct UserView: View {
    
    let users: [User] = [
        .init(id: 0, name: "Ellen", imageName: "Ellen", description: "Hey! My name is Ellen. I am a volunteer. I help animals with housing, food and pay checks."),
        .init(id: 1, name: "Andy", imageName: "Andy", description: "My name is Andy. I have been volunteering for about 5 years. I have more than 50 cats in keeping. If you want to get a friend, write to me, shipping is free from us."),
        .init(id: 2, name: "Amy", imageName: "Amy", description: "Hello everyone. I'm a veterinarian. I treat animals for free. If someone wants to help financially, then write to me!"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular users")
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(users, id: \.self) { user in
                        NavigationLink(
                            destination: NavigationLazyView(UserDetailsView(user: user)),
                            label: {
                                DiscoverUserView(user: user)
                            })
                            
                    }
                }.padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

struct DiscoverUserView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .cornerRadius(64)
            Text(user.name)
                .font(.system(size: 11, weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }
        .frame(width: 64)
            .shadow(color: .gray, radius: 2, x: 0.0, y: 1)
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        ProtectionView()
    }
}
