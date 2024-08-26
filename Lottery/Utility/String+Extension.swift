//
//  String+Extension.swift
//  Lottery
//
//  Created by Arshad shaikh on 25/08/2024.
//

import Foundation

protocol Localizable: RawRepresentable {
    var value: String { get }
}

extension Localizable where RawValue == String {
    var value: String {
        return rawValue.localized()
    }
}

extension String {
    func localized(withComment: String = "") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: withComment)
    }
}
