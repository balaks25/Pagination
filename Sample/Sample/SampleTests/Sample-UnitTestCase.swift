//
//  Sample-UnitTestCase.swift
//  Sample
//
//  Created by Balaji K S on 01/05/24.
//

import XCTest
@testable import Sample

final class Sample_UnitTestCase: XCTestCase {
    
    var sut: ProductListViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let jsonData = """
        [
          {
            "userId": 1,
            "id": 1,
            "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            "body": "quia et suscipitsuscipit recusandae consequuntur expedita et cumreprehenderit molestiae ut ut quas totamnostrum rerum est autem sunt rem eveniet architecto"
          },
          {
            "userId": 1,
            "id": 2,
            "title": "qui est esse",
            "body": "est rerum tempore vitaesequi sint nihil reprehenderit dolor beatae ea dolores nequefugiat blanditiis voluptate porro vel nihil molestiae ut reiciendisqui aperiam non debitis possimus qui neque nisi nulla"
          },
          {
            "userId": 1,
            "id": 3,
            "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
            "body": "et iusto sed quo iurevoluptatem occaecati omnis eligendi aut advoluptatem doloribus vel accusantium quis pariaturmolestiae porro eius odio et labore et velit aut"
          }
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let productList = try! decoder.decode([ProductListModel].self, from: jsonData)
        sut = ProductListViewModel(data: productList)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetProduct() {
        // Act
        let product = sut.getProduct(0)
        
        // Assert
        XCTAssertNotNil(product)
        XCTAssertEqual(product?.userId, 1)
        XCTAssertEqual(product?.id, 1)
        XCTAssertEqual(product?.title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
        XCTAssertEqual(product?.body, "quia et suscipitsuscipit recusandae consequuntur expedita et cumreprehenderit molestiae ut ut quas totamnostrum rerum est autem sunt rem eveniet architecto")
    }
    
    func testGetNumberOfRows() {
        // Act
        let numberOfRows = sut.getNumberOfRows()
        
        // Assert
        XCTAssertEqual(numberOfRows, 3)
    }

}
