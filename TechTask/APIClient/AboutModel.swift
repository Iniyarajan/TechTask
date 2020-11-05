//
//  AboutModel.swift
//  TechTask
//
//  Created by MAC on 03/07/19.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

// MARK: - Canada
struct Canada: Codable {
    let title: String
    let rows: [Row]
}

// MARK: - Row
struct Row: Codable {
    let title, rowDescription: String?
    let thumbnailImage: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case thumbnailImage = "imageHref"
    }
}
