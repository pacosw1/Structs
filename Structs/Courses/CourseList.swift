//
//  SwiftUIView.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(0..<structData.count) {
                    i in
                    NavigationLink(destination: CourseHome(data: structData[i], structIndex: i)) {
                        CourseRow(data: structData[i])
                    }
                }
            }
            .navigationBarTitle(Text("Structs"))
            }
        
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
        
    }
}

