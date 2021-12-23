//
//  ShelterDetailsView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI

struct ShelterDetails {
    let description: String
    let photos: [String]
    let reviews: [Review]
}

struct Review: Hashable {
    let user: User
    let rating: Int
    let text: String
}

class ShelterDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    
    @Published var details: ShelterDetails?
    
}

struct ShelterDetailsView: View {
    
    @ObservedObject var vm = ShelterDetailsViewModel()
    
    let shelter: Shelter
    
    var body: some View {
        ScrollView {
            
            ZStack(alignment: .bottomLeading) {
                Image(shelter.imageName)
                    .resizable()
                    .scaledToFill()
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("About Shelter")
                    .font(.system(size: 16, weight: .bold))
                
                Text("We love our companion animals, and so many of us are now finding our new best friends through adoption at a shelter, rather than buying from a pet store. It’s no secret that pets are being euthanized due to lack of space, and it’s happening at an alarming rate.")
                HStack {
                    Text("Rating")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                    }.foregroundColor(.yellow)
                    Spacer()
                }
                
            }.padding(.top)
            .padding(.horizontal)
            
            
                Text(vm.details?.description ?? "")
                .padding(.top, 8)
                .font(.system(size: 14, weight: .regular))
                    .padding(.horizontal)
                    .padding(.bottom)
            
                ReviewsList()
            
        }
        .navigationBarTitle(shelter.name, displayMode: .inline)
    }
    
}

struct ReviewsList: View {
    
    let reviews: [Review] = [
        .init(user: .init(id: 0, name: "Amy", imageName: "Amy", description: ""), rating: 4, text: "I like this Shelter!"),
        .init(user: .init(id: 1, name: "Ellen", imageName: "Ellen", description: ""), rating: 5, text: "OMG! The best shelter!!! 5stars!!!"),
        .init(user: .init(id: 2, name: "Andy", imageName: "Andy", description: ""), rating: 3, text: "Not bad!")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Customer Reviews")
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }
        .padding(.horizontal)
        
            ForEach(reviews, id: \.self) { review in
                VStack(alignment: .leading) {
                    HStack {
                        Image(review.user.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(review.user.name)")
                                .font(.system(size: 14, weight: .bold))
                            
                            HStack(spacing: 4) {
                                ForEach(0..<review.rating, id: \.self) { num in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                
                                ForEach(0..<5 - review.rating, id: \.self) { num in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                            .font(.system(size: 12))
                        }
                        Spacer()
                        Text("Dec 2020")
                            .font(.system(size: 14, weight: .bold))
                        
                    }
                    Text(review.text)
                        .font(.system(size: 14, weight: .regular))
                        
                }.padding(.top)
                .padding(.horizontal)
            }
            
    }
}


struct ShelterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShelterDetailsView(shelter: .init(name: "Hope", imageName: "tapas"))
            
        }
    }
}
