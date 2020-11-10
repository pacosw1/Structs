//
//  CourseRow.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseRow: View {
    
    
    var data: Struct
    
    var body: some View {
        
        HStack {
            VStack {
                RowHeader(title: data.lesson, level: data.level)
                RowDetail(desc: data.description, progress: data.percentage)
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 30)
//        .background(Color.black.opacity(0.05))
       
    }
}



struct RowDetail: View {
    
    var desc: String
    var progress: Float
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
//                ProgressBar(value: 0.2)
//                    .frame(width: 150, alignment: .leading)
                Text(desc)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
}



struct RowHeader: View {
    
    var title: String
    var level: String
    
    var body: some View {
        
        HStack {
            Text(title)
                .font(.system(size: 15))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            
 
                Text(level).font(.system(size: 10))
                   
       
          
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow(data: structData[0])
    }
}
