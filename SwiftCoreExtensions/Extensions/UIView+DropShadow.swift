//
//  UIView+DropShadow.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/10.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import UIKit

extension UIView {
    
    func addDropShadowToView() {
        self.layer.masksToBounds =  false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
    }
}
