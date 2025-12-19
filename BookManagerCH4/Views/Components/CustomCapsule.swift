//
//  Capsul.swift
//  BookManagerCH4
//
//  Created by Jorge Gabriel Marin Urias on 12/2/25.
//

import SwiftUI

struct CustomCapsule: View {
    //This are the props
    var text: String
    var color = Color.accentColor //this prop has a default value, so it's optional
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
    }
}
