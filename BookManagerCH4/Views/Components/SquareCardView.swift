//
//  SquareCardView.swift
//  BookManagerCH4
//
//  Created by Jorge Gabriel Marin Urias on 12/4/25.
//

import SwiftUI

struct SquareCardView: View {
    @Binding var book: Book
    
    var body: some View {
        VStack(alignment: .leading){
            Text(book.title)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            Spacer()
            Text("\(book.author)")
                .font(.subheadline)
                .lineLimit(1)
        }
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
        .aspectRatio(contentMode: .fit)
        .cornerRadius(10)
    }
}
