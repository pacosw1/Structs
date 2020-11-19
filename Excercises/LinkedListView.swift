//
//  LinkedListView.swift
//  Structs
//
//  Created by Antonio Alemán on 19/11/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct LinkedListView: View {
    @State private var locations: [CGPoint] = [
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
            CGPoint(x: 40, y: 50),
        ]
        
        var body: some View {
            
            
            VStack{
                Text("LISTA ENCADENADA").bold().font(Font.system(size: 30, design: .default)).padding()
                Text("Acomoda los siguientes elementos en una lista doblemente encadenada en orden alfabético.").fontWeight(.light).font(.system(size: 24)).padding()
                
                HStack {
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.green)
                            Text("A")
                                .foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 60)
                        .position(locations[0]) //
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[0] = value.location
                                    })
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.orange)
                            Text("C")
                                .foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 60)
                        .position(locations[1])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[1] = value.location
                                    })
                        
                        ZStack {
                            Image("arrow").resizable().frame(width: 80, height: 40, alignment: .center)
                        }.frame(width: 80, height: 40)
                        .position(locations[2])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[2] = value.location
                                    })
                    }
                    
                    
                    
                    
                    
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            Text("B")
                                .foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 60)
                        .position(locations[3])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[3] = value.location
                                    })
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.pink)
                            Text("D")
                                .foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 60)
                        .position(locations[4])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[4] = value.location
                                    })
                        
                        ZStack {
                            Image("arrow").resizable().frame(width: 80, height: 40, alignment: .center)
                        }.frame(width: 80, height: 40)
                        .position(locations[5])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[5] = value.location
                                    })
                        
                    }
                    
                    
                    
                    
                    
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.gray)
                            Text("head")
                                .foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 60)
                        .position(locations[6])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[6] = value.location
                                    })
                        ZStack {
                            Image("arrow_down").resizable().frame(width: 40, height: 60, alignment: .center)
                        }.frame(width: 80, height: 40)
                        .position(locations[7])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[7] = value.location
                                    })
                        
                        ZStack {
                            Image("arrow_down").resizable().frame(width: 40, height: 60, alignment: .center)
                        }.frame(width: 80, height: 40)
                        .position(locations[8])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[8] = value.location
                                    })
                    }
                    
                    
                    
                    
                    
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.black)
                            Text("null")
                                .foregroundColor(Color.white)
                            
                        }.frame(width: 80, height: 60)
                        .position(locations[9])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[9] = value.location
                                    })
                        ZStack {
                            Image("arrow_down").resizable().frame(width: 40, height: 60, alignment: .center)
                        }.frame(width: 80, height: 40)
                        .position(locations[10])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[10] = value.location
                                    })
                    }
                    
                    
                }
                
                
                
                
                
                HStack {
                    
                    VStack {
                        ZStack {
                            Image("").resizable().frame(width: 80, height: 40, alignment: .center)
                        }.frame(width: 80, height: 40)
                        .position(locations[9])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[9] = value.location
                                    })
                        ZStack {
                            Image("").resizable().frame(width: 80, height: 40, alignment: .center)
                        }.frame(width: 80, height: 40)
                        .position(locations[9])
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        self.locations[9] = value.location
                                    })
                    }
                    
                    
                    
                    
                    
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("TERMINAR")
                        .fontWeight(.light)
                        .accentColor(Color.white)
                        .padding()
                }).background(Color.blue).padding()
                Spacer()
            }
        }
}

struct LinkedListView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedListView()
    }
}
