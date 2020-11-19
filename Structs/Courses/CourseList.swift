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
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(0..<structs.count) {
                    i in
                    NavigationLink(destination: CourseHome(data: $structs[i], structIndex: i)) {
                        CourseRow(data: $structs[i], structIndex: i)
                    }
                }
                
            }
            .navigationBarTitle(Text("STRUCTS"))
            .onAppear(perform: {
                structData = loadJSON("data.json")
            })
        }
        
    }
}





struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      CourseList(structs: structData)
    }
}


