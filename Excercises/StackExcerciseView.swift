//
//  StackExcerciseView.swift
//  Structs
//
//  Created by Antonio Alemán on 19/11/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct StackExcerciseView: View {
    
    @State var draggedPosition = CGPoint(x: 50.0, y: 10.0)
    @State var redPosition = CGPoint(x: 100.0, y: 10.0)

    @State var colors: [Color] = [.red, .blue, .purple, .green, .yellow, .orange]
    @State var count = 0
    @State var clickedAction = ""
    @State var returnedValue = ""

    var stackLimit = 0
    var body: some View {

        VStack {
            Text("PILA").bold().font(Font.system(size: 30, design: .default)).padding()
            Text("Usa este pequeña animacion dinamica para comprender el concepto de una pila.").font(Font.system(size: 24, design: .default)).padding()

            HStack {
                VStack {
                    Text("stack.size = " + String(count))
                    Text("Action:").bold()
                    Text(clickedAction)
                    Text("Return value:").bold()
                    Text(returnedValue)
                }
                VStack {
                    Rectangle()
                        .fill(colors[0])
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                        .opacity(count >= 6 ? 100 : 0)
                    Rectangle()
                        .fill(colors[1])
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                        .opacity(count >= 5 ? 100 : 0)
                    Rectangle()
                        .fill(colors[2])
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                        .opacity(count >= 4 ? 100 : 0)
                    Rectangle()
                        .fill(colors[3])
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                        .opacity(count >= 3 ? 100 : 0)
                    Rectangle()
                        .fill(colors[4])
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                        .opacity(count >= 2 ? 100 : 0)
                    Rectangle()
                        .fill(colors[5])
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                        .opacity(count >= 1 ? 100 : 0)
                }.padding()
            }

            HStack {
                Button(action: {
                    count += 1
                    clickedAction = "push(" + String(colors[colors.count - count].description) + ")"
                    returnedValue = ""

                }) {
                    Text("PUSH")
                        .fontWeight(.light)
                        .accentColor(Color.white)
                        .padding()
                }.background(Color.blue)
                .disabled(count == 6)

                Button(action: {
                    clickedAction = "pop()"
                    returnedValue = String(colors[colors.count - count].description) + "Object"
                    count -= 1
                }) {
                    Text("POP")
                        .fontWeight(.light)
                        .accentColor(Color.white)
                        .padding()
                }.background(Color.blue).disabled(count == 0)

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

struct StackExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        StackExcerciseView()
    }
}
