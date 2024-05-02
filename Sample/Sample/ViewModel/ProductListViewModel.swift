//
//  ProductListViewModel.swift
//  Sample
//
//  Created by Balaji K S on 01/05/24.
//

import Foundation

class ProductListViewModel: NSObject {
    
    var content: [ProductListModel]?
    var paging: Int = 1
    
    init(data: [ProductListModel]?) {
        self.content = data
        super.init()
    }
    
    func getId(_ index: Int) -> String? {
        guard let id = content?[index].id else {
            return nil
        }
        return "\(id)"
    }
    
    func getTitle(_ index: Int) -> String? {
        guard let title = content?[index].title else {
            return nil
        }
        return title
    }
    
    func getProduct(_ index: Int) -> ProductListModel? {
        guard let product = content?[index] else {
            return nil
        }
        return product
    }
    
    func getNumberOfRows() -> Int {
        return content?.prefix(paging * 10).count ?? 0
    }
    
}
