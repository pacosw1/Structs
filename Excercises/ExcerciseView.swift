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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
        
        if(excerciseName == "StackExcercise") {
            StackExcerciseView()
        }
        else if(excerciseName == "QueueExcercise") {
            QueueExcerciseView()
        }
        else {
            LinkedListView()
        }
        }.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image(systemName: "arrow.backward").foregroundColor(Color.gray)
                Text("TEMAS").fontWeight(.light).accentColor(.gray)
            }
        })
    }
}



struct ExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseView(excerciseName: "StackExcercise")
    }
}
