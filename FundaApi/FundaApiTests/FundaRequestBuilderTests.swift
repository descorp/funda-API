//
//  FundaRequestBuilderTests.swift
//  FundaApiTests
//
//  Created by Vladimir Abramichev on 20/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

import XCTest
import ApiProvider
@testable import FundaApi

class FundaRequestBuilderTests: XCTestCase {
    
    let configuration = Configuration(dictionary: ["Url":"SOME_URL", "AppKey":"SOME_KEY"])
    
    func testBuildHuurRequest() {
        let sut = FundaRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.get(type: .huur))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "SOME_URL/SOME_KEY/?type=huur")
    }
    
    func testBuildKoopRequest() {
        let sut = FundaRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.get(type: .koop))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "SOME_URL/SOME_KEY/?type=koop")
    }
    
    func testBuildMakelaarRequest() {
        let sut = FundaRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.get(type: .makelaars))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "SOME_URL/SOME_KEY/?type=makelaars")
    }

    func testBuildSearchRequest() {
        let sut = FundaRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.get(type: .koop, search: "PARAM1"))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "SOME_URL/SOME_KEY/?type=koop&zo=/PARAM1")
    }
    
    func testBuildDeepSearchRequest() {
        let sut = FundaRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.get(type: .koop, search: "PARAM1","/PARAM2","PARAM3"))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "SOME_URL/SOME_KEY/?type=koop&zo=/PARAM1/PARAM2/PARAM3")
    }
    
    func testBuildSizeParameterRequest() {
        let sut = FundaRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.get(type: .koop, size: 5))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "SOME_URL/SOME_KEY/?type=koop&pagesize=5")
    }
    
    func testBuildPageParameterRequest() {
        let sut = FundaRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.get(type: .koop, page: 10))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "SOME_URL/SOME_KEY/?type=koop&page=10")
    }
    
    func testBuildComplexRequest() {
        let sut = FundaRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.get(type: .koop, size: 100, page: 10, search: "PARAM1","/PARAM2", "PARAM3"))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "SOME_URL/SOME_KEY/?type=koop&zo=/PARAM1/PARAM2/PARAM3&pagesize=100&page=10")
    }
}
