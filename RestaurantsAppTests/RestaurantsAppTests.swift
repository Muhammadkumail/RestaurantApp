//
//  RestaurantsAppTests.swift
//  RestaurantsAppTests
//
//  Created by Kumail kashefi on 05/03/2022.
//

import XCTest

class RestaurantsAppTests: XCTestCase {
    
    func testGet_RestaurantList_With_Correct_EndPoint() {
        let expectation = XCTestExpectation.init(description: "end point is correct")
        
        RestaurantNetworkService.getRestaurantListRequest(URLConstant.EndPoints.restaurantsList.rawValue) { result in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testGet_RestaurantList_With_Wrong_EndPoint() {
        let expectation = XCTestExpectation.init(description: "end point is wrong")
        
        RestaurantNetworkService.getRestaurantListRequest("www.test.com") { result in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
