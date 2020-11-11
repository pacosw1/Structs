import Foundation
import SwiftUI
import UIKit

var structData: [Struct] = loadJSON("data.json")

func loadJSON(_ filename: String) -> [Struct] {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode([Struct].self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \([Struct].self):\n\(error)")
    }
}

func writeJSON(structs: inout [Struct], structIndex: Int, topicIndex: Int) {
    do{
        // mark topic completed
        var markTopicCompleted = true
        for flashcard in structs[structIndex].topics[topicIndex].flashcards {
            if !flashcard.completed {
                markTopicCompleted = false
            }
        }
        
        if markTopicCompleted {
            structs[structIndex].topics[topicIndex].completed = true
        }
                
        // mark lesson completed
        var markStructCompleted = true
        for topic in structs[structIndex].topics {
            if !topic.completed {
                markStructCompleted = false
            }
        }
        
        if markStructCompleted {
            structs[structIndex].completed = true
        }
        
        // add to lession %
        
            // count number of flashcards completed and divide by number of total flashcards
        var totalNumOfFlashcards = 0
        var totalCompletedFlashcards = 0
        for topic in structs[structIndex].topics {
            for flashcard in topic.flashcards {
                if flashcard.completed {
                    totalCompletedFlashcards += 1
                }
                totalNumOfFlashcards += 1
            }
        }
        structs[structIndex].percentage = Float(totalCompletedFlashcards) / Float(totalNumOfFlashcards) * 100.0
        
        let path = Bundle.main.path(forResource: "data", ofType: "json")!
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let jsonData = try encoder.encode(structs)
        
        //print("------- Data to write on JSON")
        //print(print(NSString(data: jsonData, encoding: 1)!))
        
        let url = URL.init(fileURLWithPath: path)
        try jsonData.write(to: url)
    } catch {
        print("Could not write to JSON")
    }
}
