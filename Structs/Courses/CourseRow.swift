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
                RowDetail(title: $data.lesson, desc: $data.description, progress: $data.percentage)
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
    
    @Binding var title: String
    @Binding var desc: String
    @Binding var progress: Float
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                //                ProgressBar(value: 0.2)
                //                    .frame(width: 150, alignment: .leading)
                Text(desc)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                if #available(iOS 14.0, *) {
                    ProgressView(value: progress, total: 100).progressViewStyle(LinearProgressViewStyle(tint: title == "LA PILA" ? Color.blue : (title == "LA FILA" ? Color.green : Color.orange)))
                } else {
                    // Fallback on earlier versions
                }
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
                .fontWeight(.light)
                .font(.system(size: 22))
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(title == "LA PILA" ? Color.blue : (title == "LA FILA" ? Color.green : Color.orange))
                .foregroundColor(.white)
                .cornerRadius(3)
            Spacer()
            Text(level).italic().fontWeight(.light).font(.system(size: 14))
        }
    }
}

//struct CourseRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseRow(data: structData[0], structIndex: 0)
//    }
//}
