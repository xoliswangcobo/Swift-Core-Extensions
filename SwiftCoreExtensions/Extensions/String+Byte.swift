//
//  String+Byte.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/10.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import Foundation

public extension String {
    
    func asBytes() -> [UInt8]? {
        let length = self.count
        
        if ((length & 1 != 0) || (length == 0) || (length % 2 != 0)) {
            return nil
        }
        
        var bytes = [UInt8]()
        bytes.reserveCapacity(length/2)
        
        var index = self.startIndex
        
        for _ in 0..<length/2 {
            let nextIndex = self.index(index, offsetBy: 2)
            if let b = UInt8(self[index..<nextIndex], radix: 16) {
                bytes.append(b)
            } else {
                return nil
            }
            index = nextIndex
        }
        
        return bytes
    }
}
