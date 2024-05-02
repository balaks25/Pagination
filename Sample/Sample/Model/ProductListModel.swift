//
//  ProductListModel.swift
//  Sample
//
//  Created by Balaji K S on 01/05/24.
//

import Foundation

class ProductListModel: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try values.decode(Int.self, forKey: .userId)
        self.id = try values.decode(Int.self, forKey: .id)
        self.title = try values.decode(String.self, forKey: .title)
        self.body = try values.decode(String.self, forKey: .body)
    }
}
