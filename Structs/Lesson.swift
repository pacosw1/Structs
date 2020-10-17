//
//  Lesson.swift
//  Structs
//
//  Created by paco williams on 10/17/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class Lesson: NSObject {
    
    init(n: String, p: Float, d: String, desc: String) {
        Name = n
        Progress = p
        Difficulty = d
        Description = desc
    }

    var Name: String
    var Progress: Float
    var Difficulty: String
    var Description: String
}
