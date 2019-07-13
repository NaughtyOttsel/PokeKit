
@testable import PokeKit
import XCTest

class DecodingTests: XCTestCase {
    let decoder = JSONDecoder()

    func testDecodingEvolutionChain() {
        let evolutionChainJSON = #"{"baby_trigger_item":null,"chain":{"evolution_details":[],"evolves_to":[{"evolution_details":[{"gender":null,"held_item":null,"item":null,"known_move":null,"known_move_type":null,"location":null,"min_affection":null,"min_beauty":null,"min_happiness":null,"min_level":16,"needs_overworld_rain":false,"party_species":null,"party_type":null,"relative_physical_stats":null,"time_of_day":"","trade_species":null,"trigger":{"name":"level-up","url":"https://pokeapi.co/api/v2/evolution-trigger/1/"},"turn_upside_down":false}],"evolves_to":[{"evolution_details":[{"gender":null,"held_item":null,"item":null,"known_move":null,"known_move_type":null,"location":null,"min_affection":null,"min_beauty":null,"min_happiness":null,"min_level":32,"needs_overworld_rain":false,"party_species":null,"party_type":null,"relative_physical_stats":null,"time_of_day":"","trade_species":null,"trigger":{"name":"level-up","url":"https://pokeapi.co/api/v2/evolution-trigger/1/"},"turn_upside_down":false}],"evolves_to":[],"is_baby":false,"species":{"name":"venusaur","url":"https://pokeapi.co/api/v2/pokemon-species/3/"}}],"is_baby":false,"species":{"name":"ivysaur","url":"https://pokeapi.co/api/v2/pokemon-species/2/"}}],"is_baby":false,"species":{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon-species/1/"}},"id":1}"#

        guard let evolutionChainData = evolutionChainJSON.data(using: .utf8) else {
            XCTFail()
            return
        }

        do {
            let evolutionChain = try decoder.decode(EvolutionChain.self, from: evolutionChainData)
            XCTAssertNotNil(evolutionChain)
        } catch {
            XCTFail("Failed to convert JSON String to \(EvolutionChain.self)")
        }
    }

    func testDecodingBery() {
        let berryJson = #"{"firmness":{"name":"soft","url":"https://pokeapi.co/api/v2/berry-firmness/2/"},"flavors":[{"flavor":{"name":"spicy","url":"https://pokeapi.co/api/v2/berry-flavor/1/"},"potency":10},{"flavor":{"name":"dry","url":"https://pokeapi.co/api/v2/berry-flavor/2/"},"potency":0},{"flavor":{"name":"sweet","url":"https://pokeapi.co/api/v2/berry-flavor/3/"},"potency":0},{"flavor":{"name":"bitter","url":"https://pokeapi.co/api/v2/berry-flavor/4/"},"potency":0},{"flavor":{"name":"sour","url":"https://pokeapi.co/api/v2/berry-flavor/5/"},"potency":0}],"growth_time":3,"id":1,"item":{"name":"cheri-berry","url":"https://pokeapi.co/api/v2/item/126/"},"max_harvest":5,"name":"cheri","natural_gift_power":60,"natural_gift_type":{"name":"fire","url":"https://pokeapi.co/api/v2/type/10/"},"size":20,"smoothness":25,"soil_dryness":15}"#

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
        let berryFirmnessJSON = #"{"berries":[{"name":"pecha","url":"https://pokeapi.co/api/v2/berry/3/"},{"name":"pamtre","url":"https://pokeapi.co/api/v2/berry/32/"},{"name":"belue","url":"https://pokeapi.co/api/v2/berry/35/"},{"name":"wacan","url":"https://pokeapi.co/api/v2/berry/38/"},{"name":"tanga","url":"https://pokeapi.co/api/v2/berry/46/"},{"name":"charti","url":"https://pokeapi.co/api/v2/berry/47/"},{"name":"chilan","url":"https://pokeapi.co/api/v2/berry/52/"},{"name":"rowap","url":"https://pokeapi.co/api/v2/berry/64/"}],"id":1,"name":"very-soft","names":[{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"Très tendre"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Very Soft"}]}"#

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
        let berryFlavorJSON = #"{"berries":[{"berry":{"name":"rowap","url":"https://pokeapi.co/api/v2/berry/64/"},"potency":10},{"berry":{"name":"leppa","url":"https://pokeapi.co/api/v2/berry/6/"},"potency":10},{"berry":{"name":"oran","url":"https://pokeapi.co/api/v2/berry/7/"},"potency":10},{"berry":{"name":"persim","url":"https://pokeapi.co/api/v2/berry/8/"},"potency":10},{"berry":{"name":"lum","url":"https://pokeapi.co/api/v2/berry/9/"},"potency":10},{"berry":{"name":"razz","url":"https://pokeapi.co/api/v2/berry/16/"},"potency":10},{"berry":{"name":"pinap","url":"https://pokeapi.co/api/v2/berry/20/"},"potency":10},{"berry":{"name":"pomeg","url":"https://pokeapi.co/api/v2/berry/21/"},"potency":10},{"berry":{"name":"qualot","url":"https://pokeapi.co/api/v2/berry/23/"},"potency":10},{"berry":{"name":"hondew","url":"https://pokeapi.co/api/v2/berry/24/"},"potency":10},{"berry":{"name":"nomel","url":"https://pokeapi.co/api/v2/berry/30/"},"potency":10},{"berry":{"name":"belue","url":"https://pokeapi.co/api/v2/berry/35/"},"potency":10},{"berry":{"name":"rindo","url":"https://pokeapi.co/api/v2/berry/39/"},"potency":10},{"berry":{"name":"shuca","url":"https://pokeapi.co/api/v2/berry/43/"},"potency":10},{"berry":{"name":"charti","url":"https://pokeapi.co/api/v2/berry/47/"},"potency":10},{"berry":{"name":"apicot","url":"https://pokeapi.co/api/v2/berry/57/"},"potency":10},{"berry":{"name":"cheri","url":"https://pokeapi.co/api/v2/berry/1/"},"potency":10},{"berry":{"name":"chople","url":"https://pokeapi.co/api/v2/berry/41/"},"potency":15},{"berry":{"name":"figy","url":"https://pokeapi.co/api/v2/berry/11/"},"potency":15},{"berry":{"name":"occa","url":"https://pokeapi.co/api/v2/berry/36/"},"potency":15},{"berry":{"name":"tamato","url":"https://pokeapi.co/api/v2/berry/26/"},"potency":20},{"berry":{"name":"tanga","url":"https://pokeapi.co/api/v2/berry/46/"},"potency":20},{"berry":{"name":"babiri","url":"https://pokeapi.co/api/v2/berry/51/"},"potency":25},{"berry":{"name":"starf","url":"https://pokeapi.co/api/v2/berry/59/"},"potency":30},{"berry":{"name":"liechi","url":"https://pokeapi.co/api/v2/berry/53/"},"potency":30},{"berry":{"name":"spelon","url":"https://pokeapi.co/api/v2/berry/31/"},"potency":30},{"berry":{"name":"petaya","url":"https://pokeapi.co/api/v2/berry/56/"},"potency":30},{"berry":{"name":"lansat","url":"https://pokeapi.co/api/v2/berry/58/"},"potency":30},{"berry":{"name":"enigma","url":"https://pokeapi.co/api/v2/berry/60/"},"potency":40}],"contest_type":{"name":"cool","url":"https://pokeapi.co/api/v2/contest-type/1/"},"id":1,"name":"spicy","names":[{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"Épicé"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Spicy"}]}"#

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
        let contestTypeJSON = #"{"berry_flavor":{"name":"spicy","url":"https://pokeapi.co/api/v2/berry-flavor/1/"},"id":1,"name":"cool","names":[{"color":"Red","language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Cool"},{"color":"Rouge","language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"Sang-froid"}]}"#

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
        let superContestEffectJSON = #"{"appeal":2,"flavor_text_entries":[{"flavor_text":"Enables the user to perform first in the next turn.","language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"}}],"id":1,"moves":[{"name":"agility","url":"https://pokeapi.co/api/v2/move/97/"},{"name":"quick-attack","url":"https://pokeapi.co/api/v2/move/98/"},{"name":"teleport","url":"https://pokeapi.co/api/v2/move/100/"},{"name":"double-team","url":"https://pokeapi.co/api/v2/move/104/"},{"name":"cotton-spore","url":"https://pokeapi.co/api/v2/move/178/"},{"name":"mach-punch","url":"https://pokeapi.co/api/v2/move/183/"},{"name":"extreme-speed","url":"https://pokeapi.co/api/v2/move/245/"},{"name":"tailwind","url":"https://pokeapi.co/api/v2/move/366/"},{"name":"me-first","url":"https://pokeapi.co/api/v2/move/382/"},{"name":"sucker-punch","url":"https://pokeapi.co/api/v2/move/389/"},{"name":"rock-polish","url":"https://pokeapi.co/api/v2/move/397/"},{"name":"vacuum-wave","url":"https://pokeapi.co/api/v2/move/410/"},{"name":"bullet-punch","url":"https://pokeapi.co/api/v2/move/418/"},{"name":"ice-shard","url":"https://pokeapi.co/api/v2/move/420/"},{"name":"shadow-sneak","url":"https://pokeapi.co/api/v2/move/425/"},{"name":"aqua-jet","url":"https://pokeapi.co/api/v2/move/453/"}]}"#

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
        let encounterMethodJSON = #"{"id":1,"name":"walk","names":[{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"name":"Im hohen Gras oder in einer Höhle laufen"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Walking in tall grass or a cave"}],"order":1}"#

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
        let encounterConditionValueJSON = #"{"condition":{"name":"swarm","url":"https://pokeapi.co/api/v2/encounter-condition/1/"},"id":1,"name":"swarm-yes","names":[{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"name":"Während eines Schwarms"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"During a swarm"}]}"#

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
        let encounterConditionJSON = #"{"id":1,"name":"swarm","names":[{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"Essaim"},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"name":"Schwarm"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Swarm"}],"values":[{"name":"swarm-yes","url":"https://pokeapi.co/api/v2/encounter-condition-value/1/"},{"name":"swarm-no","url":"https://pokeapi.co/api/v2/encounter-condition-value/2/"}]}"#

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
        let itemJSON = #"{"attributes":[{"name":"holdable","url":"https://pokeapi.co/api/v2/item-attribute/5/"},{"name":"usable-in-battle","url":"https://pokeapi.co/api/v2/item-attribute/4/"},{"name":"consumable","url":"https://pokeapi.co/api/v2/item-attribute/2/"},{"name":"countable","url":"https://pokeapi.co/api/v2/item-attribute/1/"}],"baby_trigger_for":null,"category":{"name":"standard-balls","url":"https://pokeapi.co/api/v2/item-category/34/"},"cost":0,"effect_entries":[{"effect":"Used in battle\n:   Catches a wild Pokémon without fail.\n\n    If used in a trainer battle, nothing happens and the ball is lost.","language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"short_effect":"Catches a wild Pokémon every time."}],"flavor_text_entries":[{"language":{"name":"zh-Hans","url":"https://pokeapi.co/api/v2/language/12/"},"text":"必定能捉到野生宝可梦的，\n性能最好的球。","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"ja","url":"https://pokeapi.co/api/v2/language/11/"},"text":"野生の　ポケモンを　必ず\n捕まえることが　できる\n最高　性能の　ボール。","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best Poké Ball with the ultimate level of\nperformance. With it, you will catch any wild\nPokémon without fail.","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"it","url":"https://pokeapi.co/api/v2/language/8/"},"text":"La Poké Ball dalle prestazioni migliori: cattura\nqualsiasi Pokémon selvatico senza mai fallire.","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"es","url":"https://pokeapi.co/api/v2/language/7/"},"text":"La Poké Ball definitiva. Atrapa cualquier Pokémon\nsalvaje y no falla nunca.","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"text":"Der beste Ball! Damit fängst du garantiert jedes\nwilde Pokémon.","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"text":"Assurément la Ball la plus performante.\nElle permet de capturer à coup sûr un Pokémon\nsauvage.","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"zh-Hant","url":"https://pokeapi.co/api/v2/language/4/"},"text":"性能最好的球。\n必定能捉到野生寶可夢。","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"ko","url":"https://pokeapi.co/api/v2/language/3/"},"text":"야생 포켓몬을 반드시\n잡을 수 있는\n최고 성능의 볼.","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"ja-Hrkt","url":"https://pokeapi.co/api/v2/language/1/"},"text":"やせいの　ポケモンを　かならず\nつかまえることが　できる\nさいこう　せいのうの　ボール。","version_group":{"name":"ultra-sun-ultra-moon","url":"https://pokeapi.co/api/v2/version-group/18/"}},{"language":{"name":"zh-Hans","url":"https://pokeapi.co/api/v2/language/12/"},"text":"必定能捉到野生宝可梦的，\n性能最好的球。","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"ja","url":"https://pokeapi.co/api/v2/language/11/"},"text":"野生の　ポケモンを　必ず\n捕まえることが　できる\n最高　性能の　ボール。","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best Poké Ball with the ultimate level of\nperformance. With it, you will catch any wild\nPokémon without fail.","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"it","url":"https://pokeapi.co/api/v2/language/8/"},"text":"La Poké Ball dalle prestazioni migliori: cattura\nqualsiasi Pokémon selvatico senza mai fallire.","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"es","url":"https://pokeapi.co/api/v2/language/7/"},"text":"La Poké Ball definitiva. Atrapa cualquier Pokémon\nsalvaje y no falla nunca.","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"text":"Der beste Ball! Damit fängst du garantiert jedes\nwilde Pokémon.","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"text":"Assurément la Ball la plus performante.\nElle permet de capturer à coup sûr un Pokémon\nsauvage.","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"zh-Hant","url":"https://pokeapi.co/api/v2/language/4/"},"text":"性能最好的球。\n必定能捉到野生寶可夢。","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"ko","url":"https://pokeapi.co/api/v2/language/3/"},"text":"야생 포켓몬을 반드시\n잡을 수 있는\n최고 성능의 볼.","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"ja-Hrkt","url":"https://pokeapi.co/api/v2/language/1/"},"text":"やせいの　ポケモンを　かならず\nつかまえることが　できる\nさいこう　せいのうの　ボール。","version_group":{"name":"sun-moon","url":"https://pokeapi.co/api/v2/version-group/17/"}},{"language":{"name":"ja","url":"https://pokeapi.co/api/v2/language/11/"},"text":"野生の　ポケモンを　必ず\n捕まえることが　できる\n最高　性能の　ボール。","version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best Poké Ball with the ultimate\nlevel of performance. With it, you will\ncatch any wild Pokémon without fail.","version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"language":{"name":"it","url":"https://pokeapi.co/api/v2/language/8/"},"text":"La Poké Ball dalle prestazioni migliori:\ncattura qualsiasi Pokémon selvatico senza\nmai fallire.","version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"language":{"name":"es","url":"https://pokeapi.co/api/v2/language/7/"},"text":"La Poké Ball definitiva. Atrapa cualquier Pokémon\nsalvaje y no falla nunca.","version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"text":"Der beste Ball! Damit fängst du garantiert jedes\nwilde Pokémon.","version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"text":"Assurément la Ball la plus performante.\nElle permet de capturer à coup sûr un Pokémon\nsauvage.","version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"language":{"name":"ko","url":"https://pokeapi.co/api/v2/language/3/"},"text":"야생 포켓몬을 반드시\n잡을 수 있는\n최고 성능의 볼.","version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"language":{"name":"ja-Hrkt","url":"https://pokeapi.co/api/v2/language/1/"},"text":"やせいの　ポケモンを　かならず\nつかまえることが　できる\nさいこう　せいのうの　ボール。","version_group":{"name":"x-y","url":"https://pokeapi.co/api/v2/version-group/15/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best Ball with the ultimate level of\nperformance. It will catch any wild\nPokémon without fail.","version_group":{"name":"black-2-white-2","url":"https://pokeapi.co/api/v2/version-group/14/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best Ball with the ultimate level of\nperformance. It will catch any wild\nPokémon without fail.","version_group":{"name":"black-white","url":"https://pokeapi.co/api/v2/version-group/11/"}},{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"text":"Assurément la Ball la plus performante.\nElle permet de capturer à coup sûr un\nPokémon sauvage.","version_group":{"name":"black-white","url":"https://pokeapi.co/api/v2/version-group/11/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best Ball with the ultimate level of\nperformance. It will catch any wild\nPokémon without fail.","version_group":{"name":"heartgold-soulsilver","url":"https://pokeapi.co/api/v2/version-group/10/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best Ball with the ultimate level of\nperformance. It will catch any wild\nPokémon without fail.","version_group":{"name":"platinum","url":"https://pokeapi.co/api/v2/version-group/9/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best Ball with the ultimate level of\nperformance. It will catch any wild\nPokémon without fail.","version_group":{"name":"diamond-pearl","url":"https://pokeapi.co/api/v2/version-group/8/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best BALL with the ultimate\nperformance. It will catch any wild\nPOKéMON without fail.","version_group":{"name":"firered-leafgreen","url":"https://pokeapi.co/api/v2/version-group/7/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best BALL that\ncatches a POKéMON\nwithout fail.","version_group":{"name":"emerald","url":"https://pokeapi.co/api/v2/version-group/6/"}},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"text":"The best BALL that\ncatches a POKéMON\nwithout fail.","version_group":{"name":"ruby-sapphire","url":"https://pokeapi.co/api/v2/version-group/5/"}}],"fling_effect":null,"fling_power":null,"game_indices":[{"game_index":1,"generation":{"name":"generation-vii","url":"https://pokeapi.co/api/v2/generation/7/"}},{"game_index":1,"generation":{"name":"generation-vi","url":"https://pokeapi.co/api/v2/generation/6/"}},{"game_index":1,"generation":{"name":"generation-v","url":"https://pokeapi.co/api/v2/generation/5/"}},{"game_index":1,"generation":{"name":"generation-iv","url":"https://pokeapi.co/api/v2/generation/4/"}},{"game_index":1,"generation":{"name":"generation-iii","url":"https://pokeapi.co/api/v2/generation/3/"}}],"held_by_pokemon":[],"id":1,"machines":[],"name":"master-ball","names":[{"language":{"name":"zh-Hans","url":"https://pokeapi.co/api/v2/language/12/"},"name":"大师球"},{"language":{"name":"ja","url":"https://pokeapi.co/api/v2/language/11/"},"name":"マスターボール"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Master Ball"},{"language":{"name":"it","url":"https://pokeapi.co/api/v2/language/8/"},"name":"Master Ball"},{"language":{"name":"es","url":"https://pokeapi.co/api/v2/language/7/"},"name":"Master Ball"},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"name":"Meisterball"},{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"Master Ball"},{"language":{"name":"zh-Hant","url":"https://pokeapi.co/api/v2/language/4/"},"name":"大師球"},{"language":{"name":"ko","url":"https://pokeapi.co/api/v2/language/3/"},"name":"마스터볼"},{"language":{"name":"ja-Hrkt","url":"https://pokeapi.co/api/v2/language/1/"},"name":"マスターボール"}],"sprites":{"default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/master-ball.png"}}"#

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

    func testDecodingItemAttribute() {
        let itemAttributeJSON = #"{"descriptions":[{"description":"Has a count in the bag","language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"}}],"id":1,"items":[{"name":"master-ball","url":"https://pokeapi.co/api/v2/item/1/"},{"name":"ultra-ball","url":"https://pokeapi.co/api/v2/item/2/"},{"name":"great-ball","url":"https://pokeapi.co/api/v2/item/3/"},{"name":"poke-ball","url":"https://pokeapi.co/api/v2/item/4/"},{"name":"safari-ball","url":"https://pokeapi.co/api/v2/item/5/"},{"name":"net-ball","url":"https://pokeapi.co/api/v2/item/6/"},{"name":"dive-ball","url":"https://pokeapi.co/api/v2/item/7/"},{"name":"nest-ball","url":"https://pokeapi.co/api/v2/item/8/"},{"name":"repeat-ball","url":"https://pokeapi.co/api/v2/item/9/"},{"name":"timer-ball","url":"https://pokeapi.co/api/v2/item/10/"},{"name":"luxury-ball","url":"https://pokeapi.co/api/v2/item/11/"},{"name":"premier-ball","url":"https://pokeapi.co/api/v2/item/12/"},{"name":"dusk-ball","url":"https://pokeapi.co/api/v2/item/13/"},{"name":"heal-ball","url":"https://pokeapi.co/api/v2/item/14/"},{"name":"quick-ball","url":"https://pokeapi.co/api/v2/item/15/"},{"name":"cherish-ball","url":"https://pokeapi.co/api/v2/item/16/"},{"name":"potion","url":"https://pokeapi.co/api/v2/item/17/"},{"name":"antidote","url":"https://pokeapi.co/api/v2/item/18/"},{"name":"burn-heal","url":"https://pokeapi.co/api/v2/item/19/"},{"name":"ice-heal","url":"https://pokeapi.co/api/v2/item/20/"},{"name":"awakening","url":"https://pokeapi.co/api/v2/item/21/"},{"name":"paralyze-heal","url":"https://pokeapi.co/api/v2/item/22/"},{"name":"full-restore","url":"https://pokeapi.co/api/v2/item/23/"},{"name":"max-potion","url":"https://pokeapi.co/api/v2/item/24/"},{"name":"hyper-potion","url":"https://pokeapi.co/api/v2/item/25/"},{"name":"super-potion","url":"https://pokeapi.co/api/v2/item/26/"},{"name":"full-heal","url":"https://pokeapi.co/api/v2/item/27/"},{"name":"revive","url":"https://pokeapi.co/api/v2/item/28/"},{"name":"max-revive","url":"https://pokeapi.co/api/v2/item/29/"},{"name":"fresh-water","url":"https://pokeapi.co/api/v2/item/30/"},{"name":"soda-pop","url":"https://pokeapi.co/api/v2/item/31/"},{"name":"lemonade","url":"https://pokeapi.co/api/v2/item/32/"},{"name":"moomoo-milk","url":"https://pokeapi.co/api/v2/item/33/"},{"name":"energy-powder","url":"https://pokeapi.co/api/v2/item/34/"},{"name":"energy-root","url":"https://pokeapi.co/api/v2/item/35/"},{"name":"heal-powder","url":"https://pokeapi.co/api/v2/item/36/"},{"name":"revival-herb","url":"https://pokeapi.co/api/v2/item/37/"},{"name":"ether","url":"https://pokeapi.co/api/v2/item/38/"},{"name":"max-ether","url":"https://pokeapi.co/api/v2/item/39/"},{"name":"elixir","url":"https://pokeapi.co/api/v2/item/40/"},{"name":"max-elixir","url":"https://pokeapi.co/api/v2/item/41/"},{"name":"lava-cookie","url":"https://pokeapi.co/api/v2/item/42/"},{"name":"berry-juice","url":"https://pokeapi.co/api/v2/item/43/"},{"name":"sacred-ash","url":"https://pokeapi.co/api/v2/item/44/"},{"name":"hp-up","url":"https://pokeapi.co/api/v2/item/45/"},{"name":"protein","url":"https://pokeapi.co/api/v2/item/46/"},{"name":"iron","url":"https://pokeapi.co/api/v2/item/47/"},{"name":"carbos","url":"https://pokeapi.co/api/v2/item/48/"},{"name":"calcium","url":"https://pokeapi.co/api/v2/item/49/"},{"name":"rare-candy","url":"https://pokeapi.co/api/v2/item/50/"},{"name":"pp-up","url":"https://pokeapi.co/api/v2/item/51/"},{"name":"zinc","url":"https://pokeapi.co/api/v2/item/52/"},{"name":"pp-max","url":"https://pokeapi.co/api/v2/item/53/"},{"name":"old-gateau","url":"https://pokeapi.co/api/v2/item/54/"},{"name":"guard-spec","url":"https://pokeapi.co/api/v2/item/55/"},{"name":"dire-hit","url":"https://pokeapi.co/api/v2/item/56/"},{"name":"x-attack","url":"https://pokeapi.co/api/v2/item/57/"},{"name":"x-defense","url":"https://pokeapi.co/api/v2/item/58/"},{"name":"x-speed","url":"https://pokeapi.co/api/v2/item/59/"},{"name":"x-accuracy","url":"https://pokeapi.co/api/v2/item/60/"},{"name":"x-sp-atk","url":"https://pokeapi.co/api/v2/item/61/"},{"name":"x-sp-def","url":"https://pokeapi.co/api/v2/item/62/"},{"name":"poke-doll","url":"https://pokeapi.co/api/v2/item/63/"},{"name":"fluffy-tail","url":"https://pokeapi.co/api/v2/item/64/"},{"name":"blue-flute","url":"https://pokeapi.co/api/v2/item/65/"},{"name":"yellow-flute","url":"https://pokeapi.co/api/v2/item/66/"},{"name":"red-flute","url":"https://pokeapi.co/api/v2/item/67/"},{"name":"black-flute","url":"https://pokeapi.co/api/v2/item/68/"},{"name":"white-flute","url":"https://pokeapi.co/api/v2/item/69/"},{"name":"shoal-salt","url":"https://pokeapi.co/api/v2/item/70/"},{"name":"shoal-shell","url":"https://pokeapi.co/api/v2/item/71/"}],"name":"countable","names":[{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Countable"}]}"#

        guard let itemAttributeData = itemAttributeJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let itemAttribute = try decoder.decode(ItemAttribute.self, from: itemAttributeData)
            XCTAssertNotNil(itemAttribute)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(ItemAttribute.self) Object. Error: \(error)")
        }
    }

    func testDecodingLanguage() {
        let languageJSON = #"{"id":1,"iso3166":"jp","iso639":"ja","name":"ja-Hrkt","names":[{"language":{"name":"ja-Hrkt","url":"https://pokeapi.co/api/v2/language/1/"},"name":"日本語"},{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"Japonais"},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"name":"Japanisch"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"Japanese"}],"official":true}"#

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
