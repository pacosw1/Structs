//
//  TopicList.swift
//  Structs
//
//  Created by paco williams on 11/5/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import SwiftUI

struct TopicList: View {
    var body: some View {
        
        HStack {
            Text("bello")
        }
        
        
        //        .navigationBarTitle(Text("Temas"))
//
        .onAppear(perform: {
            print(structData[0])

        })
    }


}

func printData() {
    print(structData[0])
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        TopicList()
    }
}
