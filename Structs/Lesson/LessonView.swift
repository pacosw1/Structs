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
    
    func resizeImage(name: String, isAnimated: Bool) -> [CGFloat] {
        if(!isAnimated && name.count > 0) {
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
            print("for ", name)
            print("- returning", newWidth, newHeight)
            return [newWidth, newHeight]
        } else {
            print("inside else")
            return [0,0]
        }
    }
    
    var body: some View {
        
        VStack {
            Text(structData[structIndex].topics[topicIndex].name)
                .fontWeight(.light)
                .font(.system(size: 34))
                .multilineTextAlignment(.center)
            
            if #available(iOS 14.0, *) {
                
                SliderView(views:
                            data.flashcards.map { card in
                                FlashCard(text: card.text, namespace: card.animation, duration: card.duration)
                            }, current: $currentPage
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
        // .navigationBarTitle(Text(data.name))
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
    // var dimensions: [CGFloat]
    var namespace: String
    var duration: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center) ) {
            VStack {
                Text(text)
                    .fontWeight(.light)
                    .font(.system(size: 22))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                    .fixedSize(horizontal: false, vertical: true)
                //.position(x: 185, y: 100)
                if(duration > 0) {
                    AnimationView(animationNamespace: namespace, duration: duration).scaledToFit()
                } else {
                    Image(namespace)
                        .resizable().scaledToFit()
                }
                
            }
            .padding(20)
        }
        
    }
}


struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(data: structData[0].topics[1], structIndex: 1, topicIndex: 1)
    }
}


struct AnimationView: View {
    
    let animationNamespace: String
    let duration: Int
    
    var body: some View {
        ImageAnimated(animationNamespace: animationNamespace, duration: duration)
    }
}
