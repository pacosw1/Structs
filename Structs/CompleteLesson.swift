//
//  CompleteLesson.swift
//  Structs
//
//  Created by paco williams on 11/5/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CompleteLesson: View {
    var body: some View {
        VStack {
            Text("!En Hora Buena!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.vertical, 10)
            Text("Has completado esta lección. Da click en el siguiente boton para guardar tu progreso")
                .padding(.bottom, 20)
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Finalizar Lección")
                    .font(.headline)
            }
        }
        
    }
}

struct CompleteLesson_Previews: PreviewProvider {
    static var previews: some View {
        CompleteLesson()
    }
}
