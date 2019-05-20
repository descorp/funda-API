//
//  FundaApiTests.swift
//  FundaApiTests
//
//  Created by Vladimir Abramichev on 16/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import XCTest
#if os(OSX)
import ApiProviderMac
@testable import FundaApiMac
#elseif os(iOS)
import ApiProvider
@testable import FundaApi
#endif

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
    
    func testSize() {
        let successExpectation = expectation(description: "Success")
        apiProvider.request(Endpoint.get(type: .huur, size: 10)) { result in
            if case .success(let responce) = result {
                XCTAssertNotNil(responce)
                XCTAssertNotNil(responce.objects)
                XCTAssertEqual(responce.objects!.count, 10)
            } else {
                XCTFail("Error: \(result)")
            }
            successExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPage() {
        let successExpectation = expectation(description: "Success")
        apiProvider.request(Endpoint.get(type: .huur, page: 2)) { result in
            if case .success(let responce) = result {
                XCTAssertNotNil(responce)
                XCTAssertNotNil(responce.objects)
                XCTAssertEqual(responce.paging.huidigePagina, 2)
            } else {
                XCTFail("Error: \(result)")
            }
            successExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testWrongSearchPage() {
        let successExpectation = expectation(description: "Success")
        apiProvider.request(Endpoint.get(type: .huur, search: "random", "words")) { result in
            if case .success(let responce) = result {
                XCTAssertNotNil(responce)
                XCTAssertNotNil(responce.objects)
                XCTAssertEqual(responce.objects?.count, 0)
            } else {
                XCTFail("Error: \(result)")
            }
            successExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
