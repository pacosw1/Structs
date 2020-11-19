//
//  ScoreModal.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/18/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct ScoreModal: View {
    
    var Score: Int
    var reset: () -> Void
    
    var body: some View {
        
        VStack {
            Text("Calificacion")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.black.opacity(0.7))
            HStack {
                Spacer()
                Text(String(Score))
                    .font(.system(size: 80))
                    .foregroundColor(scoreColor(score: Score))
                    .padding(.bottom, 20)
                Text("/ 100")
                    .font(.subheadline)
                    .offset(x: -5, y: 10.0)
                    .foregroundColor(Color.black.opacity(0.6))
                Spacer()
                
            }
            
            
            QuizAction(passed: Score >= 70, reset: reset)
            Spacer()
        }
        .padding(.top, 45)
        
    }
    
    
    
    
    func scoreColor(score: Int) -> Color {
        
        switch score {
        case 0...69:
            return Color.red.opacity(0.7)
        case 70...100:
            return Color.green.opacity(0.7)
        default:
            return Color.green
            
        }
    }
}

struct QuizAction: View {
    
    var passed: Bool
    var reset: () -> Void
    
    var body: some View {
        
        Text(passed ? "Felicidades, has completado este curso!" : "Intentalo de Nuevo")
            .padding(.bottom, 30)
            .font(.headline)
        
        Button(action: {
            if !passed {
                reset()
            }
        }) {
            
            Text(passed ? "Regresar a Lecciones": "Volver a Intentar")
                .font(.headline)
                .padding(20)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
            
        
        
    }
}

//struct ScoreModal_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreModal(Score: 90, modalShown: true)
//    }
//}
