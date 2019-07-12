
@testable import PokeKit
import XCTest

class DecodingTests: XCTestCase {
    let decoder = JSONDecoder()

    func testDecodingEvolutionChain() {
        let tyrogueJson = #"{"baby_trigger_item":null,"chain":{"evolution_details":[],"evolves_to":[{"evolution_details":[{"gender":null,"held_item":null,"item":null,"known_move":null,"known_move_type":null,"location":null,"min_affection":null,"min_beauty":null,"min_happiness":null,"min_level":16,"needs_overworld_rain":false,"party_species":null,"party_type":null,"relative_physical_stats":null,"time_of_day":"","trade_species":null,"trigger":{"name":"level-up","url":"https://pokeapi.co/api/v2/evolution-trigger/1/"},"turn_upside_down":false}],"evolves_to":[{"evolution_details":[{"gender":null,"held_item":null,"item":null,"known_move":null,"known_move_type":null,"location":null,"min_affection":null,"min_beauty":null,"min_happiness":null,"min_level":32,"needs_overworld_rain":false,"party_species":null,"party_type":null,"relative_physical_stats":null,"time_of_day":"","trade_species":null,"trigger":{"name":"level-up","url":"https://pokeapi.co/api/v2/evolution-trigger/1/"},"turn_upside_down":false}],"evolves_to":[],"is_baby":false,"species":{"name":"venusaur","url":"https://pokeapi.co/api/v2/pokemon-species/3/"}}],"is_baby":false,"species":{"name":"ivysaur","url":"https://pokeapi.co/api/v2/pokemon-species/2/"}}],"is_baby":false,"species":{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon-species/1/"}},"id":1}"#

        guard let tyrogueData = tyrogueJson.data(using: .utf8) else {
            XCTFail()
            return
        }

        do {
            let result = try decoder.decode(EvolutionChain.self, from: tyrogueData)
            XCTAssertNotNil(result)
        } catch {
            XCTFail("Failed to convert JSON String to \(EvolutionChain.self)")
        }
    }

    func testDecodingBery() {
        let berryJson = #"{"id": 1,"name": "cheri","growth_time": 3,"max_harvest": 5,"natural_gift_power": 60,"size": 20,"smoothness": 25,"soil_dryness": 15,"firmness": {"name":"soft","url":"https://pokeapi.co/api/v2/berry-firmness/2/"},"flavors": [{"potency": 10,"flavor": {"name": "spicy","url": "https://pokeapi.co/api/v2/berry-flavor/1/"}}],"item": {"name": "cheri-berry","url": "https://pokeapi.co/api/v2/item/126/"},"natural_gift_type": {"name": "fire","url": "https://pokeapi.co/api/v2/type/10/"}}"#

        guard let berryData = berryJson.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let berry: Berry = try decoder.decode(Berry.self, from: berryData)
            XCTAssertNotNil(berry)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(Berry.self) Object")
        }
    }

    func testDecodingBerryFirmness() {
        let berryFirmnessJSON = #"{"id": 1,"name": "very-soft","berries": [{"name": "pecha","url": "https://pokeapi.co/api/v2/berry/3/"}],"names": [{"name": "Very Soft","language": {"name": "en","url": "https://pokeapi.co/api/v2/language/9/"}}]}"#

        guard let berryFirmnessData = berryFirmnessJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let berryFirmness: BerryFirmness = try decoder.decode(BerryFirmness.self, from: berryFirmnessData)
            XCTAssertNotNil(berryFirmness)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(BerryFirmness.self) Object")
        }
    }

    func testDecodingBerryFlavor() {
        let berryFlavorJSON = #"{"id": 1,"name": "spicy","berries": [{"potency": 10,"berry": {"name": "rowap","url": "https://pokeapi.co/api/v2/berry/64/"}}],"contest_type": {"name":"cool","url": "https://pokeapi.co/api/v2/contest-type/1/"},"names": [{"name": "Spicy","language": {"name": "en","url": "https://pokeapi.co/api/v2/language/9/"}}]}"#

        guard let berryFlavorData = berryFlavorJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let berryFlavor: BerryFlavor = try decoder.decode(BerryFlavor.self, from: berryFlavorData)
            XCTAssertNotNil(berryFlavor)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(BerryFlavor.self) Object")
        }
    }

    func testDecodingContestType() {
        let contestTypeJSON = #"{"id": 1,"name": "cool","berry_flavor": {"name": "spicy","url": "https://pokeapi.co/api/v2/berry-flavor/1/"},"names": [{"name": "Cool","color": "Red","language": {"name": "en","url": "https://pokeapi.co/api/v2/language/9/"}}]}"#

        guard let contestTypeData = contestTypeJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let contestType: ContestType = try decoder.decode(ContestType.self, from: contestTypeData)
            XCTAssertNotNil(contestType)
        } catch {
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
        } catch {
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
        } catch {
            XCTFail("Failed to Decode JSON Data into \(EncounterMethod.self) Object, \(error.localizedDescription)")
        }
    }

    func testDecodingEncounterConditionValue() {
        let encounterConditionValueJSON = #"{"id":1,"name":"swarm-yes","condition":{"name":"swarm","url":"http://pokeapi.co/api/v2/encounter-condition/1/"},"names":[{"name":"WÃ¤hrend eines Schwarms","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}]}"#

        guard let encounterConditionValueData = encounterConditionValueJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let encounterConditionValue = try decoder.decode(EncounterConditionValue.self, from: encounterConditionValueData)
            XCTAssertNotNil(encounterConditionValue)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(EncounterConditionValue.self) Object, \(error.localizedDescription)")
        }
    }

    func testDecodingEncounterCondition() {
        let encounterConditionJSON = #"{"id":1,"name":"swarm","values":[{"name":"swarm-yes","url":"http://pokeapi.co/api/v2/encounter-condition-value/1/"},{"name":"swarm-no","url":"http://pokeapi.co/api/v2/encounter-condition-value/2/"}],"names":[{"name":"Schwarm","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}]}"#

        guard let encounterConditionData = encounterConditionJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let encounterCondition = try decoder.decode(EncounterCondition.self, from: encounterConditionData)
            XCTAssertNotNil(encounterCondition)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(EncounterCondition.self) Object, \(error.localizedDescription)")
        }
    }

    func testDecodingGeneration() {
        let generationJSON = #"{"id":1,"name":"generation-i","abilities":[],"main_region":{"name":"kanto","url":"http://pokeapi.co/api/v2/region/1/"},"moves":[{"name":"pound","url":"http://pokeapi.co/api/v2/move/1/"}],"names":[{"name":"Generation I","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}],"pokemon_species":[{"name":"bulbasaur","url":"http://pokeapi.co/api/v2/pokemon-species/1/"}],"types":[{"name":"normal","url":"http://pokeapi.co/api/v2/type/1/"}],"version_groups":[{"name":"red-blue","url":"http://pokeapi.co/api/v2/version-group/1/"}]}"#

        guard let generationData = generationJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let generation = try decoder.decode(Generation.self, from: generationData)
            XCTAssertNotNil(generation)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(Generation.self) Object, \(error.localizedDescription)")
        }
    }

    func testDecodingPokedex() {
        let pokedexJSON = #"{"id":2,"name":"kanto","is_main_series":true,"descriptions":[{"description":"Rot/Blau/Gelb Kanto Dex","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}],"names":[{"name":"Kanto","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}],"pokemon_entries":[{"entry_number":1,"pokemon_species":{"name":"bulbasaur","url":"http://pokeapi.co/api/v2/pokemon-species/1/"}}],"region":{"name":"kanto","url":"http://pokeapi.co/api/v2/region/1/"},"version_groups":[{"name":"red-blue","url":"http://pokeapi.co/api/v2/version-group/1/"}]}"#

        guard let pokedexData = pokedexJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let pokedex = try decoder.decode(Pokedex.self, from: pokedexData)
            XCTAssertNotNil(pokedex)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(Pokedex.self) Object, \(error.localizedDescription)")
        }
    }

    func testDecodingVersion() {
        let versionJSON = #"{"id":1,"name":"red","names":[{"name":"Rot","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}],"version_group":{"name":"red-blue","url":"http://pokeapi.co/api/v2/version-group/1/"}}"#

        guard let versionData = versionJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let version = try decoder.decode(Version.self, from: versionData)
            XCTAssertNotNil(version)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(Version.self) Object, \(error.localizedDescription)")
        }
    }

    func testDecodingVersionGroups() {
        let versionGroupJSON = #"{"id":1,"name":"red-blue","order":1,"generation":{"name":"generation-i","url":"http://pokeapi.co/api/v2/generation/1/"},"move_learn_methods":[{"name":"level-up","url":"http://pokeapi.co/api/v2/move-learn-method/1/"}],"pokedexes":[{"name":"kanto","url":"http://pokeapi.co/api/v2/pokedex/2/"}],"regions":[{"name":"kanto","url":"http://pokeapi.co/api/v2/region/1/"}],"versions":[{"name":"red","url":"http://pokeapi.co/api/v2/version/1/"}]}"#

        guard let versionGroupData = versionGroupJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let versionGroup = try decoder.decode(VersionGroup.self, from: versionGroupData)
            XCTAssertNotNil(versionGroup)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(VersionGroup.self) Object, \(error.localizedDescription)")
        }
    }

    func testDecodingItem() {
        let itemJSON = #"{"id":1,"name":"master-ball","cost":0,"fling_power":10,"fling_effect":{"name":"flinch","url":"http://pokeapi.co/api/v2/item-fling-effect/7/"},"attributes":[{"name":"holdable","url":"http://pokeapi.co/api/v2/item-attribute/5/"}],"category":{"name":"standard-balls","url":"http://pokeapi.co/api/v2/item-category/34/"},"effect_entries":[{"effect":"Used in battle\n:   [Catches]{mechanic:catch} a wild Pokémon without fail.\n\n    If used in a trainer battle, nothing happens and the ball is lost.","short_effect":"Catches a wild Pokémon every time.","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"flavor_text_entries":[{"text":"é‡Žç”Ÿã�®ã€€ãƒ�ã‚±ãƒ¢ãƒ³ã‚’ã€€å¿…ã�š\næ�•ã�¾ã�ˆã‚‹ã�“ã�¨ã�Œã€€ã�§ã��ã‚‹\næœ€é«˜ã€€æ€§èƒ½ã�®ã€€ãƒœãƒ¼ãƒ«ã€‚","version_group":{"name":"x-y","url":"http://pokeapi.co/api/v2/version-group/15/"},"language":{"name":"ja-kanji","url":"http://pokeapi.co/api/v2/language/11/"}}],"game_indices":[{"game_index":1,"generation":{"name":"generation-vi","url":"http://pokeapi.co/api/v2/generation/6/"}}],"names":[{"name":"Master Ball","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"held_by_pokemon":[{"pokemon":{"name":"chansey","url":"http://pokeapi.co/api/v2/pokemon/113/"},"version_details":[{"rarity":50,"version":{"name":"soulsilver","url":"http://pokeapi.co/api/v2/version/16/"}}]}],"baby_trigger_for":{"url":"http://pokeapi.co/api/v2/evolution-chain/1/"}}"#

        guard let itemData = itemJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let item = try decoder.decode(Item.self, from: itemData)
            XCTAssertNotNil(item)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(Item.self) Object, \(error.localizedDescription)")
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
        } catch {
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
        } catch {
            XCTFail("Failed to Decode JSON Data into \(EvolutionTrigger.self) Object")
        }
    }

    static var allTests = [
        ("testDecodingEvolutionChain", testDecodingEvolutionChain),
        ("testBerryDecodingSuccessful", testDecodingBery),
        ("testDecodingBerryFirmness", testDecodingBerryFirmness),
        ("testDecodingLanguage", testDecodingLanguage),
        ("testDecodingEvolutionTrigger", testDecodingEvolutionTrigger),
    ]
}
