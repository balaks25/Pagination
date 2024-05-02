//
//  ProductViewModel.swift
//  Sample
//
//  Created by Balaji K S on 01/05/24.
//

import Foundation

class ProductViewModel: NSObject {
    
    var content: ProductListModel?
    
    init(data: ProductListModel?) {
        self.content = data
        super.init()
    }
    
    func getuserId() -> String {
        guard let userId = content?.userId else {
            return ""
        }
        return "User Id: \(String(describing: userId))"
    }
    
    func getProductId() -> String {
        guard let id = content?.id else {
            return ""
        }
        return "Product Id: \(String(describing: id))"
    }
    
    func getProductTitle() -> String {
        guard let title = content?.title else {
            return ""
        }
        return "Title: \(String(describing: title))"
    }
    
    func getProductBody() -> String {
        guard let body = content?.body else {
            return ""
        }
        return "Body: \(String(describing: body))"
    }

}
