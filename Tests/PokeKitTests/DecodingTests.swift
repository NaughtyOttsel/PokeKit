
import XCTest
@testable import PokeKit

class DecodingTests: XCTestCase {
    
    let decoder = JSONDecoder()
    
    func testDecodingEvolutionChain() {
        let tyrogueJson = #"{"baby_trigger_item":null,"chain":{"evolution_details":[],"evolves_to":[{"evolution_details":[{"gender":null,"held_item":null,"item":null,"known_move":null,"known_move_type":null,"location":null,"min_affection":null,"min_beauty":null,"min_happiness":null,"min_level":16,"needs_overworld_rain":false,"party_species":null,"party_type":null,"relative_physical_stats":null,"time_of_day":"","trade_species":null,"trigger":{"name":"level-up","url":"https://pokeapi.co/api/v2/evolution-trigger/1/"},"turn_upside_down":false}],"evolves_to":[{"evolution_details":[{"gender":null,"held_item":null,"item":null,"known_move":null,"known_move_type":null,"location":null,"min_affection":null,"min_beauty":null,"min_happiness":null,"min_level":32,"needs_overworld_rain":false,"party_species":null,"party_type":null,"relative_physical_stats":null,"time_of_day":"","trade_species":null,"trigger":{"name":"level-up","url":"https://pokeapi.co/api/v2/evolution-trigger/1/"},"turn_upside_down":false}],"evolves_to":[],"is_baby":false,"species":{"name":"venusaur","url":"https://pokeapi.co/api/v2/pokemon-species/3/"}}],"is_baby":false,"species":{"name":"ivysaur","url":"https://pokeapi.co/api/v2/pokemon-species/2/"}}],"is_baby":false,"species":{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon-species/1/"}},"id":1}"#
        
        guard let tyrogueData = tyrogueJson.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        do
        {
            let result = try decoder.decode(EvolutionChain.self, from: tyrogueData)
            XCTAssertNotNil(result)
        }
        catch {
            XCTFail("Failed to convert JSON String to \(EvolutionChain.self)")
        }
    }
    
    func testDecodingBery() {
        let berryJson = #"{"id": 1,"name": "cheri","growth_time": 3,"max_harvest": 5,"natural_gift_power": 60,"size": 20,"smoothness": 25,"soil_dryness": 15,"firmness": {"name":"soft","url":"https://pokeapi.co/api/v2/berry-firmness/2/"},"flavors": [{"potency": 10,"flavor": {"name": "spicy","url": "https://pokeapi.co/api/v2/berry-flavor/1/"}}],"item": {"name": "cheri-berry","url": "https://pokeapi.co/api/v2/item/126/"},"natural_gift_type": {"name": "fire","url": "https://pokeapi.co/api/v2/type/10/"}}"#
        
        guard let berryData = berryJson.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }
        
        do
        {
            let berry: Berry = try decoder.decode(Berry.self, from: berryData)
            XCTAssertNotNil(berry)
        }
        catch {
            XCTFail("Failed to Decode JSON Data into \(Berry.self) Object")
        }
    }
    func testDecodingBerryFirmness() {
        
        let berryFirmnessJSON = #"{"id": 1,"name": "very-soft","berries": [{"name": "pecha","url": "https://pokeapi.co/api/v2/berry/3/"}],"names": [{"name": "Very Soft","language": {"name": "en","url": "https://pokeapi.co/api/v2/language/9/"}}]}"#
        
        guard let berryFirmnessData = berryFirmnessJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }
        
        do
        {
            let berryFirmness: BerryFirmness = try decoder.decode(BerryFirmness.self, from: berryFirmnessData)
            XCTAssertNotNil(berryFirmness)
        }
        catch {
            XCTFail("Failed to Decode JSON Data into \(BerryFirmness.self) Object")
        }
    }
    
    func testDecodingBerryFlavor() {
        let berryFlavorJSON = #"{"id": 1,"name": "spicy","berries": [{"potency": 10,"berry": {"name": "rowap","url": "https://pokeapi.co/api/v2/berry/64/"}}],"contest_type": {"name":"cool","url": "https://pokeapi.co/api/v2/contest-type/1/"},"names": [{"name": "Spicy","language": {"name": "en","url": "https://pokeapi.co/api/v2/language/9/"}}]}"#
        
        guard let berryFlavorData = berryFlavorJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }
        
        do
        {
            let berryFlavor: BerryFlavor = try decoder.decode(BerryFlavor.self, from: berryFlavorData)
            XCTAssertNotNil(berryFlavor)
        }
        catch {
            XCTFail("Failed to Decode JSON Data into \(BerryFlavor.self) Object")
        }
    }
    
    func testDecodingContestType() {
        
        let contestTypeJSON = #"{"id": 1,"name": "cool","berry_flavor": {"name": "spicy","url": "https://pokeapi.co/api/v2/berry-flavor/1/"},"names": [{"name": "Cool","color": "Red","language": {"name": "en","url": "https://pokeapi.co/api/v2/language/9/"}}]}"#
        
        guard let contestTypeData = contestTypeJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }
        
        do
        {
            let contestType: ContestType = try decoder.decode(ContestType.self, from: contestTypeData)
            XCTAssertNotNil(contestType)
        }
        catch {
            XCTFail("Failed to Decode JSON Data into \(ContestType.self) Object")
        }
    }
    
    func testDecodingSuperContestEffect() {
        
        let superContestEffectJSON = #"{"id": 1,"appeal": 2,"flavor_text_entries": [{"flavor_text": "Enables the user to perform first in the next turn.","language": {"name": "en","url": "https://pokeapi.co/api/v2/language/9/"}}],"moves":[{"name": "agility","url": "https://pokeapi.co/api/v2/move/97/"}]}"#
        
        guard let superContestEffectData = superContestEffectJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }
        
        do {
            let superContestEffect = try decoder.decode(SuperContestEffect.self, from: superContestEffectData)
            XCTAssertNotNil(superContestEffect)
        }
        catch {
            XCTFail("Failed to Decode JSON Data into \(SuperContestEffect.self) Object, \(error.localizedDescription)")
        }
    }
    
    func testDecodingEncounterMethod() {
        
        let encounterMethodJSON = #"{"id": 1,"name": "walk","order": 1,"names": [{"name": "Walking in tall grass or a cave","language": {"name": "en","url": "http://pokeapi.co/api/v2/language/9/"}}]}"#
        
        guard let encounterMethodData = encounterMethodJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }
        
        do {
            let encounterMethod = try decoder.decode(EncounterMethod.self, from: encounterMethodData)
            XCTAssertNotNil(encounterMethod)
        }
        catch {
            XCTFail("Failed to Decode JSON Data into \(EncounterMethod.self) Object, \(error.localizedDescription)")
        }
    }
    
    func testDecodingLanguage() {
        let languageJSON = ##"{"id":1,"iso3166":"jp","iso639":"ja","name":"ja-Hrkt","names":[{"language":{"name":"ja-Hrkt","url":"https://pokeapi.co/api/v2/language/1/"},"name":"日本語"},{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"Japonais"},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"name":"Japanisch"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Japanese"}],"official":true}"##
        
        guard let languageData = languageJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }
        
        do {
            let lang = try decoder.decode(Language.self, from: languageData)
            XCTAssertNotNil(lang)
        }
        catch {
            XCTFail("Failed to Decode JSON Data into \(Language.self) Object")
        }
    }
    
    func testDecodingEvolutionTrigger() {
        let evolutionTriggerJSON = ##"{"id":2,"name":"trade","names":[{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"Échange"},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"name":"Tausch"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Trade"}],"pokemon_species":[{"name":"alakazam","url":"https://pokeapi.co/api/v2/pokemon-species/65/"},{"name":"machamp","url":"https://pokeapi.co/api/v2/pokemon-species/68/"},{"name":"golem","url":"https://pokeapi.co/api/v2/pokemon-species/76/"},{"name":"gengar","url":"https://pokeapi.co/api/v2/pokemon-species/94/"},{"name":"politoed","url":"https://pokeapi.co/api/v2/pokemon-species/186/"},{"name":"slowking","url":"https://pokeapi.co/api/v2/pokemon-species/199/"},{"name":"steelix","url":"https://pokeapi.co/api/v2/pokemon-species/208/"},{"name":"scizor","url":"https://pokeapi.co/api/v2/pokemon-species/212/"},{"name":"kingdra","url":"https://pokeapi.co/api/v2/pokemon-species/230/"},{"name":"porygon2","url":"https://pokeapi.co/api/v2/pokemon-species/233/"},{"name":"huntail","url":"https://pokeapi.co/api/v2/pokemon-species/367/"},{"name":"gorebyss","url":"https://pokeapi.co/api/v2/pokemon-species/368/"},{"name":"rhyperior","url":"https://pokeapi.co/api/v2/pokemon-species/464/"},{"name":"electivire","url":"https://pokeapi.co/api/v2/pokemon-species/466/"},{"name":"magmortar","url":"https://pokeapi.co/api/v2/pokemon-species/467/"},{"name":"porygon-z","url":"https://pokeapi.co/api/v2/pokemon-species/474/"},{"name":"dusknoir","url":"https://pokeapi.co/api/v2/pokemon-species/477/"},{"name":"gigalith","url":"https://pokeapi.co/api/v2/pokemon-species/526/"},{"name":"conkeldurr","url":"https://pokeapi.co/api/v2/pokemon-species/534/"},{"name":"escavalier","url":"https://pokeapi.co/api/v2/pokemon-species/589/"},{"name":"accelgor","url":"https://pokeapi.co/api/v2/pokemon-species/617/"},{"name":"milotic","url":"https://pokeapi.co/api/v2/pokemon-species/350/"},{"name":"aromatisse","url":"https://pokeapi.co/api/v2/pokemon-species/683/"},{"name":"trevenant","url":"https://pokeapi.co/api/v2/pokemon-species/709/"},{"name":"gourgeist","url":"https://pokeapi.co/api/v2/pokemon-species/711/"},{"name":"slurpuff","url":"https://pokeapi.co/api/v2/pokemon-species/685/"}]}"##
        guard let evolutionTriggerData = evolutionTriggerJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }
        
        do {
            let evolutionTrigger = try decoder.decode(EvolutionTrigger.self, from: evolutionTriggerData)
            XCTAssertNotNil(evolutionTrigger)
        }
        catch {
            XCTFail("Failed to Decode JSON Data into \(EvolutionTrigger.self) Object")
        }
    }
    
    static var allTests = [
        ("testDecodingEvolutionChain", testDecodingEvolutionChain),
        ("testBerryDecodingSuccessful", testDecodingBery),
        ("testDecodingBerryFirmness", testDecodingBerryFirmness),
        ("testDecodingLanguage", testDecodingLanguage),
        ("testDecodingEvolutionTrigger", testDecodingEvolutionTrigger)
    ]
}
