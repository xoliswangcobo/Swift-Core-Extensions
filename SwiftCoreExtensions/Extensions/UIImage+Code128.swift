//
//  UIImage+Code128.swift
//  Xoliswa Ngcobo
//
//  Created by Xoliswa on 2019/10/15.
//  Copyright © 2019 Xoliswa Ngcobo. All rights reserved.
//

import UIKit

public extension UIImage {

    convenience init?(barcode: String) {
        let data = barcode.data(using: .ascii)
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else {
            return nil
        }
        filter.setValue(data, forKey: "inputMessage")
        guard let ciImage = filter.outputImage else {
            return nil
        }
        self.init(ciImage: ciImage)
    }

}
