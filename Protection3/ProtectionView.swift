//
//  ProtectionView.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI

struct ProtectionView: View {
    var body: some View {
        NavigationView {
            VStack {
                PopularClinicsView()
                PopularSheltersView()
                UserView()
            }
        }
        .navigationBarTitle("Protection")
    }
}

struct ProtectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProtectionView()
    }
}
