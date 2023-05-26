//
//  Architecture_TemplatesTests.swift
//  Architecture TemplatesTests
//
//  Created by Rodrigo Galvez on 13/05/23.
//

import XCTest
@testable import Architecture_Templates

final class AsynchronousTests: XCTestCase {
    let timeout: TimeInterval = 2
    var expectation : XCTestExpectation!
    
    override func setUp() {
        expectation = expectation(description: "Server responds in reasonable time")
    }
    
    func test_ModelServerResponse() {
        User.makeRequest { result in
            defer { self.expectation.fulfill() }
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let failure):
                XCTAssertNil(failure)
            }
        }
        waitForExpectations(timeout: timeout)
    }

    func test_ModelDecoding() {
        let url = NetworkManager.fullUrl(for: User.self)
        XCTAssertNotNil(url)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            defer { self.expectation.fulfill() }
            
            XCTAssertNil(error)
            do {
                let response = try XCTUnwrap(response as? HTTPURLResponse)
                XCTAssert(response.statusCode == 200)
                
                let data = try XCTUnwrap(data)
                XCTAssertNoThrow {
                    try JSONDecoder().decode([User].self, from: data)
                }
            } catch { }
        }
        .resume()
        waitForExpectations(timeout: timeout)
    }
    
}
