//
//  ExcerciseView.swift
//  Structs
//
//  Created by Antonio Alemán on 19/11/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct ExcerciseView: View {
    
    var excerciseName: String
    var body: some View {
        
        if(excerciseName == "StackExcercise") {
            StackExcerciseView()
        }
        else if(excerciseName == "QueueExcercise") {
            QueueExcerciseView()
        }
        else {
            LinkedListView()
        }
    }
}



struct ExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseView(excerciseName: "StackExcercise")
    }
}
