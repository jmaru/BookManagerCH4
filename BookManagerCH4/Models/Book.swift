//
//  Book.swift
//  BookManagerCH4
//
//  Created by Jorge Gabriel Marin Urias on 11/22/25.
//

import Foundation

struct Book: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var coverImage: String = "default_book"
    var details: String
    
    var rating: Int = 0
    var review: String = ""
    var status: ReadingStatus = .unknown
    var genre: Genre = .unknown
}
