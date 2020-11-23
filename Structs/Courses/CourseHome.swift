//
//  CourseHome.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseHome: View {
    
    @Binding var data: Struct
    @Binding var bigTitle: String
    @Binding var bigTitleColor: Color
    var structIndex: Int
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack {
            HomeHeader(data: $data, structIndex: structIndex)
            Divider()
            List {
                ForEach(0..<data.topics.count) {
                    i in
                    NavigationLink(
                        destination: LessonView(data: data.topics[i], structIndex: structIndex, topicIndex: i, bigTitle: $bigTitle, bigTitleColor: $bigTitleColor)) {
                        
                        TopicRow(topic: $data.topics[i], prevTopic: i == 0 ? $data.topics[i] : $data.topics[i-1])
                    }.navigationBarHidden(true)
                    .disabled(i == 0 ? false : !data.topics[i-1].completed)
                }
                NavigationLink(destination: ExcerciseView(excerciseName: data.excercise.name)) {
                    HStack {
                        Text("Ejercicio").fontWeight(.light).font(.system(size: 20)).padding(8)
                        Spacer()
                        
                        Image("lock")
                        
                    }
                }.navigationBarHidden(true)
                
                QuizTab(open: data.topics[data.topics.count-1].completed, quiz: data.quiz, structIndex: structIndex)
                
            }
            .navigationBarHidden(true)
            .onAppear(perform: {
                self.data = loadJSON("data.json")[structIndex]
            })
        }
    }
}


struct QuizTab: View {
    
    var open: Bool
    var quiz: Quiz
    var structIndex: Int
    
    var body: some View {
        
        NavigationLink(destination: QuizView(quiz: quiz, structIndex: structIndex)) {
            
            VStack {
                HStack {
                    Text("Quiz").fontWeight(.light).font(.system(size: 20)).padding(8)
                    Spacer()
                    Image(systemName: open ? "lock.open" : "lock")
                }
                
            }
        }.disabled(!open)
    }
}


struct HomeHeader: View {
    
    @Binding var data: Struct
    var structIndex: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .leading)  {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName: "arrow.backward").foregroundColor(Color.gray)
                    Text("STRUCTS").accentColor(.gray)
                }
                
            }.padding(.top)
            .padding(.bottom)
            Text(data.lesson)
                .fontWeight(.light)
                .font(.system(size: 48))
                .multilineTextAlignment(.leading)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(data.lesson == "LA PILA" ? Color.blue : (data.lesson == "LA FILA" ? Color.green : Color.orange))
                .foregroundColor(.white)
                .cornerRadius(3)
            
            HStack {
                Spacer()
            }
            
            Text(data.description)
                .fontWeight(.light)
                .font(.system(size: 16))
            
            Text("TEMAS")
                .fontWeight(.light)
                .italic()
                .padding(.top, 20)
        }
        .padding(.horizontal,20)
        .padding(.top, 10)
        .padding(.bottom, 0)
    }
}


struct TopicRow: View {
    
    @Binding var topic: Topic
    @Binding var prevTopic: Topic
    
    
    var body: some View {
        HStack {
            Text(topic.name).fontWeight(.light).font(.system(size: 20)).padding(8)
            Spacer()
            
            Image(systemName: topic.completed || topic.id == 1 || prevTopic.completed ? "lock.open" : "lock")
            
        }
    }
}
//struct TestContainer: View {
//
//    @State var structs: [Struct]
//
//    var body: some View {
//
//
//        VStack {
//            CourseHome(data: $structs[0], bigTitle: Binding<false>, structIndex: 0)
//        }
//
//
//            .onAppear(perform: {
//                structData = loadJSON("data.json")
//            })
//
//    }
//}


//struct CourseHome_Previews: PreviewProvider {
//    static var previews: some View {
//        TestContainer(structs: structData)
//
//    }
//}
