//
//  UIApplication+Window.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/16.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var keyWindow:UIWindow? {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}
