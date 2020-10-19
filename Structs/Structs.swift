//
//  Structs.swift
//  Structs
//
//  Created by Ale Pestana on 10/17/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import Foundation

// MARK: - Structs
struct Structs: Codable {
    let structs: [Struct]
}

// MARK: - Struct
struct Struct: Codable {
    let lesson, description, level: String
    let percentage: Float
    let completed, quizCompleted: Bool
    let topics: [Topic]
}

// MARK: - Topic
struct Topic: Codable {
    let name: String
    let completed: Bool
    let flashcards: [Flashcard]
}

// MARK: - Flashcard
struct Flashcard: Codable {
    let text: String
    let animation: String
    let completed: Bool
}
