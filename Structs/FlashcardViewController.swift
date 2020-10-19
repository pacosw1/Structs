//
//  FlashcardViewController.swift
//  Structs
//
//  Created by paco williams on 10/19/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class FlashcardViewController: UIViewController {
    
    
    var Flashcards: [Flashcard]!
    var TopicName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        title = TopicName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
