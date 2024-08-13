//
//  String+Extensions.swift
//  DefaultAvatar
//
//  Created by Saadet Şimşek on 13/08/2024.
//

import Foundation

extension String {
    func getFirstSembols() -> String{
        self.split(separator: " ")
            .prefix(2)
            .reduce("", {$0 + String( $1 [$1.startIndex] ) } )
    }
}
