//
//  CourseHome.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseHome: View {
        
    var data: Struct
    
    var body: some View {
        
        Text(data.lesson)
    }
}

struct CourseHome_Previews: PreviewProvider {
    static var previews: some View {
        CourseHome(data: structData[0])
    }
}
