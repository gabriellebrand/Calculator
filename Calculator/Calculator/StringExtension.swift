//
//  StringExtension.swift
//  Calculator
//
//  Created by Gabrielle Brandenburg dos Anjos on 04/03/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import Foundation

extension String {
    func trunc(_ length: Int) -> String {
        if self.characters.count > length {
            return self.substring(to: self.characters.index(self.startIndex, offsetBy: length))
        } else {
            return self
        }
    }
}
