//
//  Decodable+Any.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/10.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import Foundation

private protocol JSONSerializableCollection {
    func jsonString() -> String?
}

extension JSONSerializableCollection {
    func jsonString() -> String? {
        let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [])
        guard jsonData != nil else {return nil}
        let jsonString = String(data: jsonData!, encoding: .utf8)
        guard jsonString != nil else {return nil}
        return jsonString!
    }
}

extension Array: JSONSerializableCollection { }

extension Dictionary: JSONSerializableCollection { }

extension NSDictionary: JSONSerializableCollection { }

extension NSArray: JSONSerializableCollection { }

extension Decodable {
    static func decode<T: Decodable>(_ jsonCollection:Any?) -> T? {
        if let theData = jsonCollection as? JSONSerializableCollection {
            do {
                if let theJSONData = theData.jsonString()?.data(using: .utf8) {
                    let model = try JSONDecoder().decode(T.self, from:theJSONData)
                    return model
                } else {
                    return nil
                }
            } catch let error {
                print(error)
                return nil
            }
        } else {
            return nil
        }
    }
}
