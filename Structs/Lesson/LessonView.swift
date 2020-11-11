//
//  LessonView.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct LessonView: View {
    
    @State var data: Topic
    @State var structIndex: Int
    @State var topicIndex: Int
    
    @State private var currentPage: Int = 0
    @State private var canFinish: Bool = false
    
    var body: some View {
        
        //animation
        
        VStack {
            
            if #available(iOS 14.0, *) {
                SliderView(
                    
                    views:
                        data.flashcards.map { card in
                            FlashCard(text: card.text)
                        }
                    , current: $currentPage
                    
                    
                )
                .onChange(of: currentPage) { value in
                    // Mark all pages (except first) as completed
                    structData[structIndex].topics[topicIndex].flashcards[currentPage].completed = true
                    writeJSON(structs: &structData, structIndex: structIndex, topicIndex: topicIndex)
                    canFinish = currentPage == data.flashcards.count-1
                }
            } else {
                // Fallback on earlier versions
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text(canFinish ? "Marcar como Terminado": "")
                    .accentColor(Color.white)
                    .font(.headline)
                }
                .disabled(!canFinish)
                Spacer()

            }
            .padding(.vertical, 20)
            .frame(height: 90)
            .background(canFinish ? Color.blue.opacity(1): Color.gray.opacity(0.1))

        }
        .navigationBarTitle(Text(data.name))
        .onAppear(perform: {
            // Mark first page as completed
            structData[structIndex].topics[topicIndex].flashcards[0].completed = true
            writeJSON(structs: &structData, structIndex: structIndex, topicIndex: topicIndex)
        })
        
        
    }
}


struct FlashCard: View {
    
    var text: String
    
    var body: some View {
        
        VStack {
            Text(text)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            
        }
        .padding(20)
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(data: structData[0].topics[0], structIndex: 0, topicIndex: 0)
    }
}
