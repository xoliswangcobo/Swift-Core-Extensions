//
//  NSMutableAttributedString+Tappable.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/10.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    public struct AttributeSet {
        let link:String
        let stringValue:String
        let color:UIColor
    }
    
    public func addAttributeSets(attributeSets:[AttributeSet]) {
        let str:NSString = self.string as NSString
        
        for attributeSet in attributeSets {
            let range = str.range(of:attributeSet.stringValue)
            self.addAttribute(.foregroundColor, value:attributeSet.color, range:range)
            self.addAttribute(.link, value: attributeSet.link, range:range)
        }
    }
}
