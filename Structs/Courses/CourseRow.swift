//
//  CourseRow.swift
//  Structs
//
//  Created by Francisco Sainz Williams on 11/9/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct CourseRow: View {

    @Binding var data: Struct
    var structIndex: Int
    
    var body: some View {
        
        HStack {
            VStack {
                RowHeader(title: $data.lesson, level: $data.level)
                RowDetail(desc: $data.description, progress: $data.percentage)
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 30)
        .onAppear(perform: {
            self.data = loadJSON("data.json")[structIndex]
        })
        //        .background(Color.black.opacity(0.05))
        
    }
}



struct RowDetail: View {
    
    @Binding var desc: String
    @Binding var progress: Float
    
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
    
    @Binding var title: String
    @Binding var level: String
    
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

//struct CourseRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseRow(data: structData[0], structIndex: 0)
//    }
//}
