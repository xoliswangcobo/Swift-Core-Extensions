//
//  Encodable+Any.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/10.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import Foundation

extension Encodable {
    static func encode<T: Encodable>(decoded:T?) -> Any? {
        do {
            let encoded = try JSONEncoder().encode(decoded)
            return try JSONSerialization.jsonObject(with:encoded, options: [])
        } catch {
            return nil
        }
    }
}
