//
//  CourseHome.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseHome: View {
    
    // @State var showDetail: Bool = false
    
    @Binding var data: Struct
    var structIndex: Int
    
    var body: some View {
        
        VStack {
            HomeHeader(data: $data, structIndex: structIndex)
            Divider()
            List {
                ForEach(0..<data.topics.count) {
                    i in
                    NavigationLink(
                        destination: LessonView(data: data.topics[i], structIndex: structIndex, topicIndex: i)) {
                        
                        TopicRow(topic: $data.topics[i], prevTopic: i == 0 ? $data.topics[i] : $data.topics[i-1])
                    }
                    .disabled(i == 0 ? false : !data.topics[i-1].completed)
                }
                NavigationLink(destination: ExcerciseView(excerciseName: data.excercise.name)) {
                    HStack {
                        Text("Ejercicio").fontWeight(.light).font(.system(size: 20)).padding(8)
                        Spacer()
                        
                        Image("lock")
                        
                    }
                }
                
                QuizTab(open: data.topics[data.topics.count-1].completed, quiz: data.quiz)
                
            }
            .onAppear(perform: {
                self.data = loadJSON("data.json")[structIndex]
            })
        }
    }
}



struct ExerciseTab: View {
    
    var open: Bool
    var quiz: Quiz
    
    var body: some View {
        
        NavigationLink(destination: QuizView(quiz: quiz)) {
            
            VStack {
                HStack {
                    Text("Ejercicio Final").fontWeight(.light).font(.system(size: 20)).padding(8)
                    Spacer()
                    Image(systemName: open ? "lock.open" : "lock")
                }
                
            }
        }.disabled(!open)
    }
}


struct QuizTab: View {
    
    var open: Bool
    var quiz: Quiz
    
    var body: some View {
        
        NavigationLink(destination: QuizView(quiz: quiz)) {
            
            VStack {
                HStack {
                    Text("Examen Final").fontWeight(.light).font(.system(size: 20)).padding(8)
                    Spacer()
                    Image(systemName: open ? "lock.open" : "lock")
                }
                
            }
        }.disabled(false)
    }
}


struct HomeHeader: View {
    
    @Binding var data: Struct
    var structIndex: Int
    
    var body: some View {
        VStack(alignment: .leading)  {
            Text(data.lesson)
                .fontWeight(.light)
                .font(.system(size: 48))
                .multilineTextAlignment(.leading)
                .background(data.lesson == "LA PILA" ? Color.blue : (data.lesson == "LA FILA" ? Color.green : Color.orange))
                .foregroundColor(.white)
            
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
struct TestContainer: View {
    
    @State var structs: [Struct]
    
    var body: some View {
        
        
        VStack {
            CourseHome(data: $structs[0], structIndex: 0)
        }
        

            .onAppear(perform: {
                structData = loadJSON("data.json")
            })
        
    }
}


struct CourseHome_Previews: PreviewProvider {
    static var previews: some View {
        TestContainer(structs: structData)

    }
}
