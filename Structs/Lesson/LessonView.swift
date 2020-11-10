//
//  LessonView.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct LessonView: View {
    
    var data: Topic
    
    var body: some View {
        
        
        //animation
        
        VStack {
            
            
            SliderView(
                
                    data.flashcards.map { card in
                        FlashCard(text: card.text)
                    }
                
            )
            Spacer()
//            Divider()
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                   Text("Completar Leccion")
                    .accentColor(Color.white)
                    .font(.headline)
                }
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Spacer()

            }
            .padding(.vertical, 20)
            .frame(height: 90)
            .background(Color.blue.opacity(1))
         
 
            
            
           

           
        }
        .navigationBarTitle(Text(data.name))
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
        LessonView(data: structData[0].topics[0])
    }
}
