//
//  Dictionary+String.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/10.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    init(string:String) {
        let json = try? JSONSerialization.jsonObject(with: string.data(using: .utf8)!, options: [])
        self = json as! Dictionary<Key, Value>
    }
    
    func jsonString() -> String? {
        let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [])
        guard jsonData != nil else {return nil}
        let jsonString = String(data: jsonData!, encoding: .utf8)
        guard jsonString != nil else {return nil}
        return jsonString!
    }
}
