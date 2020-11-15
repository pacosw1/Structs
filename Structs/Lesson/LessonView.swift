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
    
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    func resizeImage(_ name: String) -> [CGFloat] {
        print(name)
        let image = UIImage(named: name)!
        let width = image.size.width
        let height = image.size.height
        
        DispatchQueue.main.async {
            if width > height {
                // Landscape image
                // Use screen width if < than image width
                self.width = width > UIScreen.main.bounds.width ? UIScreen.main.bounds.width : width
                // Scale height
                self.height = self.width/width * height
            } else {
                // Portrait
                // Use 600 if image height > 600
                self.height = height > 600 ? 600 : height
                // Scale width
                self.width = self.height/height * width
            }
        }
        let newWidth = self.width * 0.55
        let newHeight = self.height * 0.55
        return [newWidth, newHeight]
    }
    
    var body: some View {
        
        //animation
        
        
        VStack {
            
            if #available(iOS 14.0, *) {
                let namespace = structData[structIndex].topics[topicIndex].flashcards[currentPage].animation
                let isAnimated = structData[structIndex].topics[topicIndex].flashcards[currentPage].isAnimated
                let hasAnimation = namespace.count > 0
                if(hasAnimation) {
                    if(isAnimated) {
                        let duration = structData[structIndex].topics[topicIndex].flashcards[currentPage].duration
                        AnimationView(animationNamespace: namespace, duration: duration).scaledToFit()
                    } else {
                        let dimensions = resizeImage(namespace)
                        Image(namespace).resizable().scaledToFit().frame(width: dimensions[0], height: dimensions[1], alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                
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
        }).gesture(DragGesture().onChanged { value in
            print(value.location)
        })
        
        
    }
}


struct FlashCard: View {
    
    var text: String
    
    var body: some View {
        
        VStack {
            //Spacer()
            Text(text)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 50)
            
        }
        .padding(20)
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(data: structData[0].topics[0], structIndex: 0, topicIndex: 0)
    }
}



struct AnimationView: View {
    let animationNamespace: String
    let duration: Int
    var body: some View {
        ImageAnimated(animationNamespace: animationNamespace, duration: duration)
    }
}
