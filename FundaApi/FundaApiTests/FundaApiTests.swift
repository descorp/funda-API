//
//  FundaApiTests.swift
//  FundaApiTests
//
//  Created by Vladimir Abramichev on 16/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import XCTest
import ApiProvider
@testable import FundaApi

class FundaApiTests: XCTestCase {
    
    var apiProvider: RemoteApiProvider!

    override func setUp() {
        let config = Configuration(bundle: Bundle(for: type(of: self)))
        let requestBuilder = FundaRequestBuilder(with: config)
        apiProvider = RemoteApiProvider(with: requestBuilder)
    }

    override func tearDown() {
        apiProvider = nil
    }

    func testGetHuur() {
        let successExpectation = expectation(description: "Success")
        apiProvider.request(Endpoint.get(type: .huur)) { result in
            if case .success(let responce) = result {
                XCTAssertNotNil(responce)
                XCTAssertNotNil(responce.objects)
                XCTAssertNotEqual(responce.objects!.count, 0)
            } else {
                XCTFail("Error: \(result)")
            }
            successExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetKoopAmsterdam() {
        let successExpectation = expectation(description: "Success")
        apiProvider.request(Endpoint.get(type: .huur, search: "amsterdam")) { result in
            if case .success(let responce) = result {
                XCTAssertNotNil(responce)
                XCTAssertNotNil(responce.objects)
                XCTAssertNotEqual(responce.objects!.count, 0)
            } else {
                XCTFail("Error: \(result)")
            }
            successExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
