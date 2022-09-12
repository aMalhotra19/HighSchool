//
//  String+Utility.swift
//  HighSchool
//
//  Created by Anju Malhotra on 9/11/22.
//

import Foundation

extension String {
    /// Manipulate the string and returns camel case string
    ///
    /// The following functions can be used to return strings with first letter uppercased
    ///
    /// print("XYZ".camelCased())
    /// Xyz
    ///
    /// print("xyx".camelCased())
    /// Xyz
    ///
    /// - Returns: updated String in Camel case format
    func camelCased() -> String {
        guard !self.isEmpty else {
            return ""
        }
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
