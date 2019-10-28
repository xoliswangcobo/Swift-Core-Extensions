//
//  String+CountryFlag.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/10.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//
// https://github.com/bendodson/flag-emoji-from-country-code/blob/master/FlagPlayground.playground/Contents.swift

import Foundation

public extension String {
    static func emojiFlag(regionCode: String) -> String? {
        let code = regionCode.uppercased()
        
        guard Locale.isoRegionCodes.contains(code) else {
            return nil
        }
        
        var flagString = ""
        for s in code.unicodeScalars {
            guard let scalar = UnicodeScalar(127397 + s.value) else {
                continue
            }
            
            flagString.append(String(scalar))
        }
        
        return flagString
    }
}
