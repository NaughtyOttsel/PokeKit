
@testable import PokeKit
import XCTest

class BerryTests: XCTestCase {
    private let decoder = JSONDecoder()
    let berryJson = #"
    {
        "id": 1,
        "name": "cheri",
        "growth_time": 3,
        "max_harvest": 5,
        "natural_gift_power": 60,
        "size": 20,
        "smoothness": 25,
        "soil_dryness": 15,
        "firmness": {
        "name": "soft",
        "url": "https://pokeapi.co/api/v2/berry-firmness/2/"
        },
        "flavors": [
        {
        "potency": 10,
        "flavor": {
        "name": "spicy",
        "url": "https://pokeapi.co/api/v2/berry-flavor/1/"
        }
        }
        ],
        "item": {
        "name": "cheri-berry",
        "url": "https://pokeapi.co/api/v2/item/126/"
        },
        "natural_gift_type": {
        "name": "fire",
        "url": "https://pokeapi.co/api/v2/type/10/"
        }
    }
    "#
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
        XCTAssertEqual(1, berry.flavors.count)
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
