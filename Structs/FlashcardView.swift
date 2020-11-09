//
//  Flashcard.swift
//  Structs
//
//  Created by paco williams on 11/4/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct FlashcardView: View {
    
    var flashcards: [Flashcard]
    var title: String
    var progress: Float
    
    var body: some View {
        
                VStack {
                 
                    Header(title: title, progress: progress)
                    Spacer()
                  
                    
                }.onAppear() {
                    
                }
         
    }
}



struct Header: View {
    
    var title: String
    var progress: Float
    
    var body: some View {
        
        HStack {
                Text(title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title)
                    .multilineTextAlignment(.leading)
            Spacer()
            
//            ProgressBar(value: progress)
        }
        .padding(.horizontal, 20)
        .frame(height: 80)
    }
}


struct ProgressBar: View {
    
    let value: Float
    
    var body: some View {
    
        if #available(iOS 14.0, *) {
            ProgressView(value: value)
        } else {
            // Fallback on earlier versions
        }
    }
        
}



struct Content: View {
    
    let text: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                Text(text)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                    .multilineTextAlignment(.leading)
                    
            }
        }
    }
}
//
//struct Flashcard_Previews: PreviewProvider {
//    static var previews: some View {
//        FlashcardView(title: "Que es una Pila", text: "Hello my name is patricia, and i am a very cool person tbh teehee,Hello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbhHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teeheeHello my name is patricia, and i am a very cool person tbh teehee teehee", progress: 0.5)
//    }
//}
