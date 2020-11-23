//
//  SwiftUIView.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    
    @State var structs: [Struct]
    @State var bigTitle: String = "STRUCTS"
    @State var bigTitleColor: Color = Color.gray
    
    var body: some View {
        
        VStack {
            Button(action: {
                print("Credits button was tapped")
            }) {
                Image(systemName: "info.circle.fill").foregroundColor(Color.black)
            }.frame(width: UIScreen.main.bounds.width, height: 20, alignment: .trailing).padding(.trailing, 50.0)
            
            Text(bigTitle).fontWeight(.bold).font(.system(size: 22)).padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(bigTitleColor == Color.gray ? Color.white : bigTitleColor)
                .foregroundColor(bigTitleColor == Color.gray ? Color.black : Color.white)
                .cornerRadius(3)
                .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .center)
           
                Spacer()
                
        NavigationView {
            
            List {
                ForEach(0..<structs.count) {
                    i in
                    NavigationLink(destination: CourseHome(data: $structs[i], bigTitle: $bigTitle, bigTitleColor: $bigTitleColor, structIndex: i)) {
                        CourseRow(data: $structs[i], structIndex: i)
                        
                    }
                    .listRowBackground(Color.white)
                }
                
            }.navigationBarHidden(true)
            .onAppear(perform: {
                structData = loadJSON("data.json")
            })
            
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        }
        
    }
}





struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      CourseList(structs: structData)
    }
}


