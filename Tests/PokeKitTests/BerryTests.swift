
@testable import PokeKit
import XCTest

class BerryTests: XCTestCase {
    private let decoder = JSONDecoder()
    let berryJson = #"{"firmness":{"name":"soft","url":"https://pokeapi.co/api/v2/berry-firmness/2/"},"flavors":[{"flavor":{"name":"spicy","url":"https://pokeapi.co/api/v2/berry-flavor/1/"},"potency":10},{"flavor":{"name":"dry","url":"https://pokeapi.co/api/v2/berry-flavor/2/"},"potency":0},{"flavor":{"name":"sweet","url":"https://pokeapi.co/api/v2/berry-flavor/3/"},"potency":0},{"flavor":{"name":"bitter","url":"https://pokeapi.co/api/v2/berry-flavor/4/"},"potency":0},{"flavor":{"name":"sour","url":"https://pokeapi.co/api/v2/berry-flavor/5/"},"potency":0}],"growth_time":3,"id":1,"item":{"name":"cheri-berry","url":"https://pokeapi.co/api/v2/item/126/"},"max_harvest":5,"name":"cheri","natural_gift_power":60,"natural_gift_type":{"name":"fire","url":"https://pokeapi.co/api/v2/type/10/"},"size":20,"smoothness":25,"soil_dryness":15}"#

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    private func getBerryDataFromJSON() -> Berry? {
        guard let berryData = berryJson.data(using: .utf8) else {
            return nil
        }
        return try? decoder.decode(Berry.self, from: berryData)
    }

    func testBerryFlavorMapHasAValue() {
        guard let berry = getBerryDataFromJSON() else {
            XCTFail("Failed to get \(Berry.self) from JSON")
            return
        }
        XCTAssertEqual(5, berry.flavors.count)
    }

    func testBerryFirmnessHasValue() {
        guard let berry = getBerryDataFromJSON() else {
            XCTFail("Failed to get \(Berry.self) from JSON")
            return
        }
        XCTAssertNotNil(berry.firmness)
    }

    func testBerryItemHasValue() {
        guard let berry = getBerryDataFromJSON() else {
            XCTFail("Failed to get \(Berry.self) from JSON")
            return
        }

        XCTAssertNotNil(berry.item)
    }

    func testBerryNaturalGiftTypeHasValue() {
        guard let berry = getBerryDataFromJSON() else {
            XCTFail("Failed to get \(Berry.self) from JSON")
            return
        }
        XCTAssertNotNil(berry.naturalGiftType)
    }

    static var allTests = [
        ("testBerryFlavorMapHasAValue", testBerryFlavorMapHasAValue),
        ("testBerryFirmnessHasValue", testBerryFirmnessHasValue),
        ("testBerryItemHasValue", testBerryItemHasValue),
        ("testBerryNaturalGiftTypeHasValue", testBerryNaturalGiftTypeHasValue),
    ]
}
