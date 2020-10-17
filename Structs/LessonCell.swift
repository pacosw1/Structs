//
//  LessonCell.swift
//  Structs
//
//  Created by paco williams on 10/17/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class LessonCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var desc: UILabel!
    
}
