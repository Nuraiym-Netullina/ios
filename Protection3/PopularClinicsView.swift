//
//  PopularClinicsView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI
import MapKit

struct PopularClinicsView: View {
    
    let clinics: [Clinic] = [
        .init(name: "Hope ", country: "US-31, Columbus", imageName: "image 1", latitude: 48.855014, longitude: 2.341231),
        .init(name: "Animal", country: "Americas Ave", imageName: "image 2", latitude: 35.67988, longitude: 139.7695),
        .init(name: "Pet Doctors", country: "3rd St, Jacksonvill", imageName: "image 3", latitude: 40.71592, longitude: -74.0055),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Veterinary clinics")
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(clinics, id: \.self) { clinic in
                        NavigationLink(
                            destination:
                                NavigationLazyView(PopularClinicDetailsView(clinic: clinic))
                                ,
                            label: {
                                PopularClinicTile(clinic: clinic)
                                    .padding(.bottom)
                            })
                       
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct ClinicDetails: Decodable {
    let description: String
}

class ClinicDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var clinicDetails: ClinicDetails?
    
    init(name: String) {

        
    }
    
}

struct PopularClinicDetailsView: View {
    
    @ObservedObject var vm: ClinicDetailsViewModel
    
    let clinic: Clinic
    
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    
    init(clinic: Clinic) {
        self.clinic = clinic
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: clinic.latitude, longitude: clinic.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
        
        self.vm = .init(name: clinic.name)
    }
    
    
    var body: some View {
        ScrollView {
            
            Image(clinic.imageName)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack(alignment: .leading) {
                Text(clinic.name)
                    .font(.system(size: 18, weight: .bold))
                Text(clinic.country)
                
                HStack {
                    Text(vm.clinicDetails?.description ?? "")
                        .padding(.top, 4)
                        .font(.system(size: 14))
                    Spacer()
                }
            }
            
            .padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                
            }.padding(.horizontal)
            
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 200)
            
        }.navigationBarTitle(clinic.name, displayMode: .inline)
    }
    
    let attractions: [Attraction] = [
        
    ]
}

struct CustomMapAnnotation: View {
    
    let attraction: Attraction
    
    var body: some View {
        VStack {
            Text(attraction.id)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            
        }.shadow(radius: 5)
    }
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let latitude, longitude: Double
}

struct PopularClinicTile: View {
    
    let clinic: Clinic
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image(clinic.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(8)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            
            Text(clinic.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(clinic.country)
                .font(.system(size: 12, weight: .regular))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}

struct PopularClinicView_Previews: PreviewProvider {
    static var previews: some View {
        PopularClinicsView()
            .colorScheme(.dark)
        
        NavigationView {
            PopularClinicDetailsView(clinic: .init(name: "Hope ", country: "US-31, Columbus", imageName: "image 1", latitude: 48.855014, longitude: 2.341231))
        }
        ProtectionView()
    }
}
