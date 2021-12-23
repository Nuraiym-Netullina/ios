//
//  TitleModifier.swift
//  Protection3
//
//  Created by Nuraiym Netullina on 21.12.2021.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
        
    func body(content: Content) -> some View {
        content
            .background(Color("tileBackground"))
            .cornerRadius(8)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 0.5), radius: 4, x: 0.0, y: 2)
    }
    
}
