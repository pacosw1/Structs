//
//  QuizView.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/11/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI


class UserAnswers: ObservableObject {
    var answers: [Int] = Array(repeating: -1, count: 5)
    
    func  reset(len: Int) -> [Int] {
        return Array(repeating: -1, count: len)
    }
}

struct QuizView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    
    var quiz: Quiz

    @ObservedObject var userData = UserAnswers()
    @State var progress: Float = 0.0
    @State var isPresented: Bool = false
    
    var body: some View {
        
        VStack(alignment:.leading) {
            QuizHeader(progress: $progress)
            Spacer()
            QuizBody(questions: quiz.questions, updateAnswer: updateAnswer, completed: completed)
            Spacer()
            HStack {
            
                Button(action: {
                    self.isPresented = true
                }) {
                    Spacer()
                    Text("Entregar")
                    .accentColor(Color.white)
                    .font(.headline)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(progress < 1 ? Color.blue.opacity(0.3) : Color.blue)
                        .padding(.vertical, 10)
                        .cornerRadius(15)
                    Spacer()
                }
                .disabled(progress < 1)
                .sheet(isPresented: $isPresented) {
                    ScoreModal(Score: computeScore(), reset: resetQuiz, finish: finishCourse)
                }
                
            }
            .padding(.horizontal, 15)
        }
    
        
    
    }
    
    
    func resetQuiz() -> Void {
        
        self.isPresented = false
        
    }
    
    func finishCourse() -> Void {
        
        //todo, mark quiz as completed, and return to main menu
        self.isPresented = false
        mode.wrappedValue.dismiss()
        
        
        
        
        
    }
    
    
    
    func computeScore() -> Int {
        
        var correct: Int = 0
        
        for i in 0..<self.quiz.questions.count {
            
            let userAnswer = self.userData.answers[i]
            
            let correctAnswer = self.quiz.questions[i].correct_answer - 1
            
            if (correctAnswer == userAnswer) {
                correct += 1
            }
            
        }
        
        let res = Float(correct) / Float(self.quiz.questions.count)
        
        return Int(res * 100.0)
        
    }
    
    
    
    func updateAnswer(questionID: Int, selectedAnswer: Int) {
        self.userData.answers[questionID] = selectedAnswer
        print(self.userData.answers)
    }
    
    func completed() {
        
        var answered: Int = 0
       
        for answer in self.userData.answers {
            
            if answer != -1 {
                answered += 1
            }
        }
        
        let res = Float(answered) / Float(self.quiz.questions.count)
        
        self.progress = res
        
        print(res)
        
    }
}


struct QuizBody: View {
    
    var questions: [Question]
    var updateAnswer: (Int, Int) -> Void
    var completed: () -> Void
    
    var body: some View {
            
            List {
                ForEach(0..<questions.count) {
                    i in
                  
                    QuestionView(updateAnswer: updateAnswer, question: questions[i], completed: completed)
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
    
    var completed: () -> Void
    
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
        updateAnswer(questionID-1, id)
        selected = id
        self.completed()
    }
    
    func renderOption(id: Int) -> RadioButtonField {
        
        let option = options[id-1]
        
        return RadioButtonField(id: id-1, label: option.answer, selected: isSelected(id: id-1), setAnswer: setAnswer)
    }

}




struct QuestionView: View {
    var updateAnswer: (Int, Int) -> Void

    var question: Question
    
    var completed: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            if question.image != "" {
                Image(question.image)
                    .resizable()
                    .frame(width: .infinity, height: 200, alignment: .center)
                    .padding(.vertical, 10)
            }
                
            
            
            QuestionHeader(question: question.question)
            QuestionOptions(updateAnswer: updateAnswer, options: question.answers, questionID: question.id, selected: -1, completed: completed)
//                .padding(.vertical, 30)
            
        }
        .frame(minHeight: question.image == "" ? 250 : 500)
        
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
    
    @Binding var progress: Float
    
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
