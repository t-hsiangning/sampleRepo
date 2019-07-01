//
//  AlertPLEntity.swift
//  TableViewEditSample
//
//  Created by Annie on 2019/7/1.
//  Copyright © 2019 Annie. All rights reserved.
//

import Foundation

struct AlertPLEntity: Codable {
    let title: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case image
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        image = try container.decode(String.self, forKey: .image)
    }
}
