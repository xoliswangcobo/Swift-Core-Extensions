//
//  Error+Lokto.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/09/02.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import Foundation

public extension NSError {
    
    static func errorForCode(code:Int) -> NSError {
        var errorDescription = ""
        
        switch code {
            case 0010: errorDescription = "An error 000 occured".localized()
            default: errorDescription = "An unknown error occured.".localized()
        }
        
        return NSError(domain:"ERROR_\(code)", code:code, userInfo:[NSLocalizedDescriptionKey : errorDescription])
    }
    
    static func errorForMessage(message:String, code:Int = 0) -> NSError {
        return NSError(domain:String(format:"ERROR_%ld", code), code:code, userInfo:[NSLocalizedDescriptionKey : message.localized()])
    }
}
