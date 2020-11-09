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
            List(structData) { item in
                NavigationLink(destination: CourseHome(data: item)) {
                    CourseRow(data: item)
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
	
