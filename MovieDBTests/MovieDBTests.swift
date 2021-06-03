//
//  MovieDBTests.swift
//  MovieDBTests
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import XCTest
import RxSwift

@testable import MovieDB

class MovieDBTests: XCTestCase {

    var disposeBag = DisposeBag()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func searchMovie() throws {
        searchMovie(movieName:"Scarface")
    }

    func searchMovie(movieName: String){

        let expectation =  self.expectation(description: "Search Request")

        let interactor = SearchInteractor()
        interactor.search(title: movieName)
            .subscribe(onNext: { mediaArray in
                XCTAssertGreaterThan(mediaArray.count, 0)
                expectation.fulfill()
            }, onError: { (error) in
                print(error)
            })
            .disposed(by: disposeBag)
        waitForExpectations(timeout: 10) { error in
            if (error != nil) {
                XCTFail("FAIL")
            }
        }
    }
}
