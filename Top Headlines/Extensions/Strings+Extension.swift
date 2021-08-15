//
//  Strings+Extension.swift
//  Strings+Extension
//
//  Created by Frank Bara on 8/14/21.
//

import Foundation

extension String {
    var withoutHtmlTags: String {
        return self.replacingOccurrences(of: "<[*>]+>", with: "", options:
        .regularExpression, range: nil).replacingOccurrences(of: "&[^;]+;", with:
        "", options: .regularExpression, range: nil)
    }
}
