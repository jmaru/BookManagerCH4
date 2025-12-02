//
//  Genre.swift
//  BookManagerCH4
//
//  Created by Jorge Gabriel Marin Urias on 12/1/25.
//

//This is an enum that will be used to determine all the possible
//genres a book will have

// Value is saved as string,
//implements protocol CaseIterable so you can iterate through cases
// Hashable makes them easy to acces (don't pay to much attention yet)
// Codable makes it possible to save them into/form json
enum Genre: String, CaseIterable, Hashable, Codable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case scienceFiction = "Science Fiction"
    case romance = "Romance"
    case horror = "Horror"
    case dystopian = "Dystopian"
    // Base case
    case unknown = "Unknown"
}
