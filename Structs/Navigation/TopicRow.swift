//
//  TopicRow.swift
//  Structs
//
//  Created by paco williams on 11/5/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct TopicRow: View {
    
    var data: Topic
    var body: some View {
        
        HStack {
            
            TopicHeader(title: data.name, progress: 0.4)
            Spacer()
            Image(systemName: data.completed ? "lock.open" : "lock")
                .foregroundColor(data.completed ? .green: .red)
                
            
        }
        .padding(.horizontal, 20)
    }
}


struct TopicHeader: View {
    
    var title: String
    var progress: Float
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tema \(1): \(title)")
                .font(.headline)
                .padding(0)
            if #available(iOS 14.0, *) {
                ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                    .frame(width: 150)
                    .offset(y: -5.0/*@END_MENU_TOKEN@*/)
                    .accentColor(.green)
            
            }
        }
    
    }
}
    


struct TopicRow_Previews: PreviewProvider {
    static var previews: some View {
        TopicRow(data: Topic(id: 1, name: "Test", completed: false, flashcards: [Flashcard(id: 1, text: "text", animation: "null", completed: false)]))
    }
}
