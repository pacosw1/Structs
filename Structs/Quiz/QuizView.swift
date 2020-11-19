//
//  QuizView.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/11/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    
    
    var quiz: Quiz
    
    @State var userAnswers: [Int] = Array(repeating: -1, count: 5)
    
    
    var body: some View {
        
        VStack(alignment:.leading) {
            QuizHeader(progress: progressAmount())
            Spacer()
            QuizBody(questions: quiz.questions, updateAnswer: updateAnswer)
            Spacer()
            HStack {
            
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Spacer()
                    Text("Entregar")
                    .accentColor(Color.white)
                    .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .padding(.vertical, 10)
                        
                        .cornerRadius(15)
                    Spacer()
                }
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.horizontal, 15)
        }
    
        
    
    }
    
    
    func updateAnswer(questionID: Int, selectedAnswer: Int) {
        self.userAnswers[questionID] = selectedAnswer
        print(self.userAnswers)
    }
    
    func progressAmount() -> Float {
        
        var answered: Int = 0
        let total = (self.userAnswers.count)
       
        for answer in self.userAnswers {
            
            if answer != -1 {
                answered += 1
            }
        }
        
        return Float(answered / total)
        
    }
}


struct QuizBody: View {
    
    var questions: [Question]
    var updateAnswer: (Int, Int) -> Void
    
    var body: some View {
            
            List {
                ForEach(0..<questions.count) {
                    i in
                  
                    QuestionView(updateAnswer: updateAnswer, question: questions[i])
                }
            }
        
        
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}



struct QuestionOptions: View {
    
    var updateAnswer: (Int, Int) -> Void
    var options: [Answer]
    var questionID: Int
    
    @State var selected: Int
    
    var body: some View {
        
        
        if #available(iOS 14.0, *) {
            List {
                ForEach(0..<options.count) {
                    i in
                    renderOption(id: i+1)
                }
            }.listStyle(DefaultListStyle())
            
        } else {
            List {
                ForEach(0..<options.count) {
                    i in
                    renderOption(id: i+1)
                }
            }
        }
        
        
        
    
    }
    
    func isSelected(id:Int) -> Bool {
        return id == selected
    }
    func setAnswer(id: Int) {
        updateAnswer(questionID, id)
        selected = id
    }
    
    func renderOption(id: Int) -> RadioButtonField {
        
        let option = options[id-1]
        
        return RadioButtonField(id: id-1, label: option.answer, selected: isSelected(id: id-1), setAnswer: setAnswer)
    }

}




struct QuestionView: View {
    var updateAnswer: (Int, Int) -> Void

    var question: Question
    
    var body: some View {
        
        VStack(alignment: .leading) {
            QuestionHeader(question: question.question)
            QuestionOptions(updateAnswer: updateAnswer, options: question.answers, questionID: question.id, selected: -1)
                .padding(.vertical, 30)
            
        }
        .frame(minHeight: 200)
        .padding(.vertical,20)
    }
}


struct QuestionHeader: View {
    
    var question: String
    
    var body: some View {
        
        VStack(alignment: .leading) {

            Text(question)
                .font(.system(size: 20))
                .bold()
                
        }
    }
}



struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quiz: structData[2].quiz)
    }
}


struct QuizHeader: View {
    
    var progress: Float
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Quiz")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
               
            ProgressBar(progress: progress)
            Divider()
        }
        .padding(.horizontal, 20)
    }
}



struct ProgressBar: View {
    
    var progress: Float

    var body: some View {
        
        
        if #available(iOS 14.0, *) {
            ProgressView(value: progress)
                .offset(x: 0, y: -10)
        } else {
            // Fallback on earlier versions
        }
    }
}
