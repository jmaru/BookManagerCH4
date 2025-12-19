//
//  FavoritesView.swift
//  BookManagerCH4
//
//  Created by Jorge Gabriel Marin Urias on 12/4/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Binding var books: [Book]
    
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    //computed property
    private var favoriteBooks: [Binding<Book>] {
        $books.filter{$0.wrappedValue.isFavorite}
    }
    
    //We'll add styling later
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: gridLayout){
                    ForEach(favoriteBooks, id: \.self.id){ book in // This is similar to the List item, except it doesn't add any predefined changed
                        NavigationLink(destination: DetailView(book: book)) {
                            SquareCardView(book: book)
                        }
                    }
                }
            }
        }
    }
}


