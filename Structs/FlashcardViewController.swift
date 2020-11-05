//
//  FlashcardViewController.swift
//  Structs
//
//  Created by paco williams on 10/19/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit
import SwiftUI




class FlashcardViewController: UIViewController {
    
    
    
    var Flashcards: [Flashcard]!
    var currentFlashcard: Flashcard!
    var TopicName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let host = UIHostingController(rootView: FlashcardView(flashcards: Flashcards, title: TopicName, progress: 0.2 ))

        navigationController?.pushViewController(host, animated: true)

     
    }
    
    
    struct Testin: View {
        var text: String
        var body: some View {
            Text(text)
        }
    }
    
    



}

struct FlashcardViewController_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
