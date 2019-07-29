//
//  Extencion.swift
//  Convert
//
//  Created by Macbook on 28/07/2019.
//  Copyright © 2019 Technology&Design LLC. All rights reserved.
//

import Foundation

extension Double {
    func toString() -> String? {
        return NumberFormatter().number(from: self)?.stringValue
    }
}
