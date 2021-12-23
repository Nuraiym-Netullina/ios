//
//  PopularSheltersView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI

struct PopularSheltersView: View {
    
    let shelters: [Shelter] = [
        .init(name: "Animal Care Society", imageName: "image 5"),
        .init(name: "Animals", imageName: "image 6"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Shelters for animals")
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(shelters, id: \.self) { shelter in
                        NavigationLink(
                            destination: ShelterDetailsView(shelter: shelter),
                            label: {
                                ShelterTile(shelter: shelter)
                                    .foregroundColor(Color(.label))
                            })
                    }
                }.padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

struct ShelterTile: View {
    
    let shelter: Shelter
    
    var body: some View {
        HStack(spacing: 8) {
            Image(shelter.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(5)
                .padding(.leading, 6)
                .padding(.vertical, 6)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(shelter.name)
                    Spacer()
                    
                }
                
                HStack {
                    Text("One of the best shelter")
                        .foregroundColor(.gray)
                }
                
                Text("Click to find out more")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.blue)
            }
            .font(.system(size: 12, weight: .semibold))

            
            Spacer()
        }
        .frame(width: 240)
        .asTile()
    }
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        ProtectionView()
        PopularSheltersView()
    }
}
