//
//  ReadingStatus.swift
//  BookManagerCH4
//
//  Created by Jorge Gabriel Marin Urias on 12/1/25.
//

// This is an enum that will be used to determine all the possible
// Readding status, so we know what books I want to read, wich one I'm currently reading, or which I have finished reading them.

// Value is saved as string,
//implements protocol CaseIterable so you can iterate through cases
// Hashable makes them easy to acces (don't pay to much attention yet)
// Codable makes it possible to save them into/form json
enum ReadingStatus: String, CaseIterable, Hashable, Codable {
    case planToRead = "Plan to Read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    // Base case
    case unknown = "Unknown"
}
