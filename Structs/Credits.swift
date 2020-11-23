//
//  Credits.swift
//  Structs
//
//  Created by Ale Pestana on 11/22/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct Credits: View {
    
    var body: some View {
        VStack {
            Text("CRÉDITOS").fontWeight(.bold).font(.system(size: 28)).padding()
            Text("STRUCTS fue desarrollado como proyecto final de la materia Proyecto de Desarrollo para dispositivos móviles en el semestre Agosto-Diciembre 2020 por Francisco Sainz, José Antonio Alemán y María Alejandra Pestana.").fontWeight(.light).padding()
            Text("Imágenes obtenidas de Google y KlipArtz.").fontWeight(.light)
        }
    }
}
