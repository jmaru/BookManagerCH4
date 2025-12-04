//
//  FavoriteToggle.swift
//  BookManagerCH4
//
//  Created by Jorge Gabriel Marin Urias on 12/4/25.
//

import SwiftUI

struct FavoriteToggle: View {
    
    @Binding var isFavorite: Bool
    
    //animation variables
    @State private var scale: CGFloat = 1 //changes the size (functions like a multiplier, 1 = actual size)
    @State private var opacity: CGFloat = 0 //changes the  (0 = fully transparent, 1 = fully visible)
    @State private var offsetY: CGFloat = 0 //changes the position in Y (0 = no change)
    
    public var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.largeTitle)
                .opacity(opacity)
                .scaleEffect(scale)
                .offset(y: offsetY)
            Toggle(isOn: $isFavorite){
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .secondary)
                
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .animation(.spring, value: isFavorite)
            .accessibilityLabel(isFavorite ? "Remove from Favorites" : "Add to Favorites")
            .onChange(of: isFavorite) { oldValue, newValue in
                guard newValue == true else {
                    return
                }
                //if guard is true it continues to here
                
                //appear and grow
                withAnimation(.spring(response:0.5, dampingFraction: 0.4)){
                    opacity = 1 // makes the heart completly visible (appear)
                    scale = 1.2 // increase size by 20% (grow)
                }
                //float and vanish
                withAnimation(.easeInOut(duration: 0.5).delay(0.3)){
                    offsetY = -100 // moves it up in the screen (float)
                    opacity = 0 // makes it transparent (vanish)
                }
                //Reset to the default size
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    scale = 1
                    offsetY = 0
                }
            }
        }
        
    }
}
