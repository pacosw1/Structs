//
//  QuizView.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/11/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        
        VStack(alignment:.leading) {
            QuizHeader(progress: 0.4)
            Spacer()
            QuizBody()
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
                
            }
            .padding(.horizontal, 15)
        }
    
        
    
    }
}


struct QuizBody: View {
    var body: some View {
        
        
        ScrollView {
            QuestionView()
        }
        
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}



struct QuestionOptions: View {
    
    @State var selected: Int
    
    var body: some View {
        
        RadioButtonField(id: 0, label: "Hest", selected: isSelected(id: 0), setAnswer: setAnswer)
        RadioButtonField(id: 1, label: "Hest", selected: isSelected(id: 1), setAnswer: setAnswer)
        RadioButtonField(id: 2, label: "Hest", selected: isSelected(id: 2), setAnswer: setAnswer)
        RadioButtonField(id: 3, label: "Hest", selected: isSelected(id: 3), setAnswer: setAnswer)
    
    
    }
    func isSelected(id:Int) -> Bool {
        return id == selected
    }
    func setAnswer(id: Int) {
        selected = id
    }

}




struct QuestionView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            QuestionHeader(question: "What is a stack?")
            QuestionOptions(selected: -1)
            
        }
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
        QuizView()
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
