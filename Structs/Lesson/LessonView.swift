//
//  LessonView.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct LessonView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var data: Topic
    @State var structIndex: Int
    @State var topicIndex: Int
    
    @State private var currentPage: Int = 0
    @State private var canFinish: Bool = false
    
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    // @Binding var showSelf: Bool
    
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
            return [newWidth, newHeight]
        } else {
            return [0,0]
        }
    }
    
    func getCurrentFlashcard() {
        
        let numOfFlashcards = data.flashcards.count
        
        while(currentPage < numOfFlashcards && data.flashcards[currentPage].completed) {
            currentPage = currentPage + 1
        }
        
        if currentPage > 0 {
            currentPage = currentPage - 1
        }
    }
    
    var body: some View {
        
        VStack {
            Text(structData[structIndex].topics[topicIndex].name)
                .fontWeight(.light)
                .font(.system(size: 34))
                .multilineTextAlignment(.center)
                .padding(.top, 40.0)
            
            if #available(iOS 14.0, *) {
                
                SliderView(views:
                            data.flashcards.map { card in
                                FlashCard(showSelf: mode, text: card.text, namespace: card.animation, duration: card.duration, flashcardID: card.id, numOfFlashcards: data.flashcards.count, structName: structData[structIndex].lesson)
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
            
        }
        // .navigationBarTitle(Text(data.name))
        .onAppear(perform: {
            // Get flashcard that user completed
            getCurrentFlashcard()
            // Mark first page as completed
            structData[structIndex].topics[topicIndex].flashcards[0].completed = true
            writeJSON(structs: &structData, structIndex: structIndex, topicIndex: topicIndex)
        }).gesture(DragGesture().onChanged { value in
            print(value.location)
        })
        
        
    }
}


struct FlashCard: View {
    
    @Binding var showSelf: PresentationMode
    var text: String
    var namespace: String
    var duration: Int
    var flashcardID: Int
    var numOfFlashcards: Int
    var structName: String
    
    func getStructColor() -> Color {
        return structName == "LA PILA" ? Color.blue : (structName == "LA FILA" ? Color.green : Color.orange)
    }
    
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
                
                HStack {
                    Button(action: {
                        $showSelf.wrappedValue.dismiss()
                    }) {
                        Text("TEMAS")
                            .fontWeight(.light)
                            .accentColor(getStructColor())
                            .padding()
                    }.border(getStructColor())
                    Spacer()
                    if(flashcardID == numOfFlashcards) {
                        Button(action: {
                            $showSelf.wrappedValue.dismiss()
                        }) {
                            Text("TERMINAR")
                                .fontWeight(.light)
                                .accentColor(Color.white)
                                .padding()
                        }.background(getStructColor())
                    } else {
                        // Avoid "TEMAS" button from centering
                        Button(action: {}) {
                        }.background(Color.white)
                    }
                    
                }.padding(.top, 40.0)
            }
            
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
}


//struct LessonView_Previews: PreviewProvider {
//    static var previews: some View {
//        LessonView(data: structData[0].topics[1], structIndex: 1, topicIndex: 1, showSelf: true)
//    }
//}


struct AnimationView: View {
    
    let animationNamespace: String
    let duration: Int
    
    var body: some View {
        ImageAnimated(animationNamespace: animationNamespace, duration: duration)
    }
}
