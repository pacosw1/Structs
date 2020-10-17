//
//  FileHelper.swift
//  Structs
//
//  Created by Ale Pestana on 10/17/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import Foundation

class Helper {
    static let  shared = Helper()
    
    init() {
    }
    
    func readJSONFilesGetFirstStruct() -> [Struct]! {
        do {
            guard let bundlePath = Bundle.main.path(forResource: "data", ofType: "json") else {return nil}
            guard let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) else {return nil}
            let root = try? JSONDecoder().decode(Structs.self, from: jsonData)
            return root?.structs
        } catch {
            return nil
        }
    }
    
}
