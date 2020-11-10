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
struct Struct: Codable, Identifiable {
    var id: Int
    let lesson: String
    let percentage: Float
    let description, level: String
    var completed: Bool
    var topics: [Topic]
    let quiz: Quiz
}

// MARK: - Quiz
struct Quiz: Codable, Identifiable {
    var id: Int
    var completed: Bool
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable, Identifiable {
    var id: Int
    let question: String
    let answers: [Answer]
}

// MARK: - Answer
struct Answer: Codable, Identifiable {
    var id: Int
    let answer: String
    let isCorrect: Bool
}

// MARK: - Topic
struct Topic: Codable, Identifiable {
    var id: Int
    let name: String
    var completed: Bool
    var flashcards: [Flashcard]
}

// MARK: - Flashcard
struct Flashcard: Hashable, Codable, Identifiable {
    var id: Int
    let text: String
    let animation: String
    var completed: Bool
}
