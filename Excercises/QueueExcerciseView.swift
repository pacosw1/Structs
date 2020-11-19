//
//  QueueExcerciseView.swift
//  Structs
//
//  Created by Antonio Alemán on 19/11/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct QueueExcerciseView: View {
    @State var draggedPosition = CGPoint(x: 50.0, y: 10.0)
    @State var redPosition = CGPoint(x: 100.0, y: 10.0)
    
    @State var colors: [Color] = [.red, .blue, .purple]
    @State var opacities: [Double] = [0,0,0,0,0,0]
    @State var count = 0
    @State var clickedAction = ""
    @State var returnedValue = ""
    
    var stackLimit = 0
    var body: some View {
        
        VStack {
            Text("FILA").bold().font(Font.system(size: 30, design: .default)).padding()
            Text("Usa este pequeña animacion dinamica para comprender el concepto de una fila.").font(Font.system(size: 24, design: .default)).padding()
            Text("queue.size = " + String(count))
            Text("Action:").bold()
            Text(clickedAction)
            Text("Return value:").bold()
            Text(returnedValue)
            
            HStack {
                Spacer()
                HStack {
                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .fill(color).frame(width: 50, height: 100)
                    }
                }.padding()
            }
            
            
            HStack {
                Button(action: {
                    let color = Color.random
                    colors.insert(color, at: 0)
                    clickedAction = "enqueue(" + color.description
                    returnedValue = String(colors[0].description) + "Object"
                }) {
                    Text("ENQUEUE")
                        .fontWeight(.light)
                        .accentColor(Color.white)
                        .padding()
                }.background(Color.blue)
                .disabled(colors.count == 6)
                
                Button(action: {
                    colors.popLast()
                    clickedAction = "dequeue()"
                    //returnedValue = String(colors[colors.count - count + 1].description) + "Object"
                }) {
                    Text("DEQUEUE")
                        .fontWeight(.light)
                        .accentColor(Color.white)
                        .padding()
                }.background(Color.blue).disabled(colors.count == 0)
                
                Button(action: {
                    clickedAction = "peek()"
                    returnedValue = count == 0 ? "NULL" : String(colors[colors.count - count].description) + "Object"
                }) {
                    Text("PEEK")
                        .fontWeight(.light)
                        .accentColor(Color.white)
                        .padding()
                }.background(Color.blue)
            }
            
        }
    }
}

struct QueueExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        QueueExcerciseView()
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
