//
//  String+Util.swift
//  NewsSwiftUI
//
//  Created by Manali Mogre on 16/07/2020.
//  Copyright © 2020 Manali Mogre. All rights reserved.
//

import Foundation

extension String {
    var dateFormattedString: String? {
        var publishedDate: String?
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        if let date = dateFormatterGet.date(from: self) {
            publishedDate = dateFormatterPrint.string(from: date)
        }
        return publishedDate
    }
}
