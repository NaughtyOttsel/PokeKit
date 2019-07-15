
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

    func testDecodingItemCategory() {
        let itemCategoryJSON = #"{"id":1,"name":"stat-boosts","items":[{"name":"guard-spec","url":"http://pokeapi.co/api/v2/item/55/"}],"names":[{"name":"Stat boosts","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"pocket":{"name":"battle","url":"http://pokeapi.co/api/v2/item-pocket/7/"}}"#

        guard let itemCategoryData = itemCategoryJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let itemCategory = try decoder.decode(ItemCategory.self, from: itemCategoryData)
            XCTAssertNotNil(itemCategory)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(ItemCategory.self) Object. Error: \(error)")
        }
    }

    func testDecodingItemFlingEffect() {
        let itemFlingEffectJSON = #"{"id":1,"name":"badly-poison","effect_entries":[{"effect":"Badly poisons the target.","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"items":[{"name":"toxic-orb","url":"http://pokeapi.co/api/v2/item/249/"}]}"#

        guard let itemFlingEffectData = itemFlingEffectJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let itemFlingEffect = try decoder.decode(ItemFlingEffect.self, from: itemFlingEffectData)
            XCTAssertNotNil(itemFlingEffect)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(ItemFlingEffect.self) Object. Error: \(error)")
        }
    }

    func testDecodingItemPocket() {
        let itemPocketJSON = #"{"id":1,"name":"misc","categories":[{"name":"collectibles","url":"http://pokeapi.co/api/v2/item-category/9/"}],"names":[{"name":"Items","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}]}"#

        guard let itemPocketData = itemPocketJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let itemPocket = try decoder.decode(ItemPocket.self, from: itemPocketData)
            XCTAssertNotNil(itemPocket)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(ItemPocket.self) Object. Error: \(error)")
        }
    }

    func testDecodingMove() {
        let moveJSON = #"{"id":1,"name":"pound","accuracy":100,"effect_chance":null,"pp":35,"priority":0,"power":40,"contest_combos":{"normal":{"use_before":[{"name":"double-slap","url":"http://pokeapi.co/api/v2/move/3/"},{"name":"headbutt","url":"http://pokeapi.co/api/v2/move/29/"},{"name":"feint-attack","url":"http://pokeapi.co/api/v2/move/185/"}],"use_after":null},"super":{"use_before":null,"use_after":null}},"contest_type":{"name":"tough","url":"http://pokeapi.co/api/v2/contest-type/5/"},"contest_effect":{"url":"http://pokeapi.co/api/v2/contest-effect/1/"},"damage_class":{"name":"physical","url":"http://pokeapi.co/api/v2/move-damage-class/2/"},"effect_entries":[{"effect":"Inflicts [regular damage]{mechanic:regular-damage}.","short_effect":"Inflicts regular damage with no additional effect.","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"effect_changes":[],"generation":{"name":"generation-i","url":"http://pokeapi.co/api/v2/generation/1/"},"meta":{"ailment":{"name":"none","url":"http://pokeapi.co/api/v2/move-ailment/0/"},"category":{"name":"damage","url":"http://pokeapi.co/api/v2/move-category/0/"},"min_hits":null,"max_hits":null,"min_turns":null,"max_turns":null,"drain":0,"healing":0,"crit_rate":0,"ailment_chance":0,"flinch_chance":0,"stat_chance":0},"names":[{"name":"Pound","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"past_values":[],"stat_changes":[],"super_contest_effect":{"url":"http://pokeapi.co/api/v2/super-contest-effect/5/"},"target":{"name":"selected-pokemon","url":"http://pokeapi.co/api/v2/move-target/10/"},"type":{"name":"normal","url":"http://pokeapi.co/api/v2/type/1/"}}"#

        guard let moveData = moveJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let move = try decoder.decode(Move.self, from: moveData)
            XCTAssertNotNil(move)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(Move.self) Object. Error: \(error)")
        }
    }

    func testDecodingMoveAilment() {
        let moveAilmentJSON = #"{"id":1,"name":"paralysis","moves":[{"name":"thunder-punch","url":"http://pokeapi.co/api/v2/move/9/"}],"names":[{"name":"Paralysis","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}]}"#

        guard let moveAilmentData = moveAilmentJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let moveAilment = try decoder.decode(MoveAilment.self, from: moveAilmentData)
            XCTAssertNotNil(moveAilment)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(MoveAilment.self) Object. Error: \(error)")
        }
    }

    func testDecodingMoveBattleStyle() {
        let moveBattleStyleJSON = #"{"id":1,"name":"attack","names":[{"name":"Attack","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}]}"#

        guard let moveBattleStyleData = moveBattleStyleJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let moveBattleStyle = try decoder.decode(MoveBattleStyle.self, from: moveBattleStyleData)
            XCTAssertNotNil(moveBattleStyle)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(MoveBattleStyle.self) Object. Error: \(error)")
        }
    }

    func testDecodingMoveCategory() {
        let moveCategoryJSON = #"{"id":1,"name":"ailment","descriptions":[{"description":"No damage; inflicts status ailment","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"moves":[{"name":"sing","url":"http://pokeapi.co/api/v2/move/47/"}]}"#

        guard let moveCategoryData = moveCategoryJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let moveCategory = try decoder.decode(MoveCategory.self, from: moveCategoryData)
            XCTAssertNotNil(moveCategory)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(MoveCategory.self) Object. Error: \(error)")
        }
    }

    func testDecodingMoveDamageClass() {
        let moveDamageClassJSON = #"{"descriptions":[{"description":"No damage","language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"}},{"description":"Sin Daño","language":{"name":"es","url":"https://pokeapi.co/api/v2/language/7/"}},{"description":"Kein Schaden","language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"}},{"description":"Aucun dégât","language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"}},{"description":"ダメージない","language":{"name":"ja-Hrkt","url":"https://pokeapi.co/api/v2/language/1/"}}],"id":1,"moves":[{"name":"swords-dance","url":"https://pokeapi.co/api/v2/move/14/"},{"name":"whirlwind","url":"https://pokeapi.co/api/v2/move/18/"},{"name":"sand-attack","url":"https://pokeapi.co/api/v2/move/28/"},{"name":"tail-whip","url":"https://pokeapi.co/api/v2/move/39/"},{"name":"leer","url":"https://pokeapi.co/api/v2/move/43/"},{"name":"growl","url":"https://pokeapi.co/api/v2/move/45/"},{"name":"roar","url":"https://pokeapi.co/api/v2/move/46/"},{"name":"sing","url":"https://pokeapi.co/api/v2/move/47/"},{"name":"supersonic","url":"https://pokeapi.co/api/v2/move/48/"},{"name":"disable","url":"https://pokeapi.co/api/v2/move/50/"},{"name":"mist","url":"https://pokeapi.co/api/v2/move/54/"},{"name":"leech-seed","url":"https://pokeapi.co/api/v2/move/73/"},{"name":"growth","url":"https://pokeapi.co/api/v2/move/74/"},{"name":"poison-powder","url":"https://pokeapi.co/api/v2/move/77/"},{"name":"stun-spore","url":"https://pokeapi.co/api/v2/move/78/"},{"name":"sleep-powder","url":"https://pokeapi.co/api/v2/move/79/"},{"name":"string-shot","url":"https://pokeapi.co/api/v2/move/81/"},{"name":"thunder-wave","url":"https://pokeapi.co/api/v2/move/86/"},{"name":"toxic","url":"https://pokeapi.co/api/v2/move/92/"},{"name":"hypnosis","url":"https://pokeapi.co/api/v2/move/95/"},{"name":"meditate","url":"https://pokeapi.co/api/v2/move/96/"},{"name":"agility","url":"https://pokeapi.co/api/v2/move/97/"},{"name":"teleport","url":"https://pokeapi.co/api/v2/move/100/"},{"name":"mimic","url":"https://pokeapi.co/api/v2/move/102/"},{"name":"screech","url":"https://pokeapi.co/api/v2/move/103/"},{"name":"double-team","url":"https://pokeapi.co/api/v2/move/104/"},{"name":"recover","url":"https://pokeapi.co/api/v2/move/105/"},{"name":"harden","url":"https://pokeapi.co/api/v2/move/106/"},{"name":"minimize","url":"https://pokeapi.co/api/v2/move/107/"},{"name":"smokescreen","url":"https://pokeapi.co/api/v2/move/108/"},{"name":"confuse-ray","url":"https://pokeapi.co/api/v2/move/109/"},{"name":"withdraw","url":"https://pokeapi.co/api/v2/move/110/"},{"name":"defense-curl","url":"https://pokeapi.co/api/v2/move/111/"},{"name":"barrier","url":"https://pokeapi.co/api/v2/move/112/"},{"name":"light-screen","url":"https://pokeapi.co/api/v2/move/113/"},{"name":"haze","url":"https://pokeapi.co/api/v2/move/114/"},{"name":"reflect","url":"https://pokeapi.co/api/v2/move/115/"},{"name":"focus-energy","url":"https://pokeapi.co/api/v2/move/116/"},{"name":"metronome","url":"https://pokeapi.co/api/v2/move/118/"},{"name":"mirror-move","url":"https://pokeapi.co/api/v2/move/119/"},{"name":"amnesia","url":"https://pokeapi.co/api/v2/move/133/"},{"name":"kinesis","url":"https://pokeapi.co/api/v2/move/134/"},{"name":"soft-boiled","url":"https://pokeapi.co/api/v2/move/135/"},{"name":"glare","url":"https://pokeapi.co/api/v2/move/137/"},{"name":"poison-gas","url":"https://pokeapi.co/api/v2/move/139/"},{"name":"lovely-kiss","url":"https://pokeapi.co/api/v2/move/142/"},{"name":"transform","url":"https://pokeapi.co/api/v2/move/144/"},{"name":"spore","url":"https://pokeapi.co/api/v2/move/147/"},{"name":"flash","url":"https://pokeapi.co/api/v2/move/148/"},{"name":"splash","url":"https://pokeapi.co/api/v2/move/150/"},{"name":"acid-armor","url":"https://pokeapi.co/api/v2/move/151/"},{"name":"rest","url":"https://pokeapi.co/api/v2/move/156/"},{"name":"sharpen","url":"https://pokeapi.co/api/v2/move/159/"},{"name":"conversion","url":"https://pokeapi.co/api/v2/move/160/"},{"name":"substitute","url":"https://pokeapi.co/api/v2/move/164/"},{"name":"sketch","url":"https://pokeapi.co/api/v2/move/166/"},{"name":"spider-web","url":"https://pokeapi.co/api/v2/move/169/"},{"name":"mind-reader","url":"https://pokeapi.co/api/v2/move/170/"},{"name":"nightmare","url":"https://pokeapi.co/api/v2/move/171/"},{"name":"curse","url":"https://pokeapi.co/api/v2/move/174/"},{"name":"conversion-2","url":"https://pokeapi.co/api/v2/move/176/"},{"name":"cotton-spore","url":"https://pokeapi.co/api/v2/move/178/"},{"name":"spite","url":"https://pokeapi.co/api/v2/move/180/"},{"name":"protect","url":"https://pokeapi.co/api/v2/move/182/"},{"name":"scary-face","url":"https://pokeapi.co/api/v2/move/184/"},{"name":"sweet-kiss","url":"https://pokeapi.co/api/v2/move/186/"},{"name":"belly-drum","url":"https://pokeapi.co/api/v2/move/187/"},{"name":"spikes","url":"https://pokeapi.co/api/v2/move/191/"},{"name":"foresight","url":"https://pokeapi.co/api/v2/move/193/"},{"name":"destiny-bond","url":"https://pokeapi.co/api/v2/move/194/"},{"name":"perish-song","url":"https://pokeapi.co/api/v2/move/195/"},{"name":"detect","url":"https://pokeapi.co/api/v2/move/197/"},{"name":"lock-on","url":"https://pokeapi.co/api/v2/move/199/"},{"name":"sandstorm","url":"https://pokeapi.co/api/v2/move/201/"},{"name":"endure","url":"https://pokeapi.co/api/v2/move/203/"},{"name":"charm","url":"https://pokeapi.co/api/v2/move/204/"},{"name":"swagger","url":"https://pokeapi.co/api/v2/move/207/"},{"name":"milk-drink","url":"https://pokeapi.co/api/v2/move/208/"},{"name":"mean-look","url":"https://pokeapi.co/api/v2/move/212/"},{"name":"attract","url":"https://pokeapi.co/api/v2/move/213/"},{"name":"sleep-talk","url":"https://pokeapi.co/api/v2/move/214/"},{"name":"heal-bell","url":"https://pokeapi.co/api/v2/move/215/"},{"name":"safeguard","url":"https://pokeapi.co/api/v2/move/219/"},{"name":"pain-split","url":"https://pokeapi.co/api/v2/move/220/"},{"name":"baton-pass","url":"https://pokeapi.co/api/v2/move/226/"},{"name":"encore","url":"https://pokeapi.co/api/v2/move/227/"},{"name":"sweet-scent","url":"https://pokeapi.co/api/v2/move/230/"},{"name":"morning-sun","url":"https://pokeapi.co/api/v2/move/234/"},{"name":"synthesis","url":"https://pokeapi.co/api/v2/move/235/"},{"name":"moonlight","url":"https://pokeapi.co/api/v2/move/236/"},{"name":"rain-dance","url":"https://pokeapi.co/api/v2/move/240/"},{"name":"sunny-day","url":"https://pokeapi.co/api/v2/move/241/"},{"name":"psych-up","url":"https://pokeapi.co/api/v2/move/244/"},{"name":"stockpile","url":"https://pokeapi.co/api/v2/move/254/"},{"name":"swallow","url":"https://pokeapi.co/api/v2/move/256/"},{"name":"hail","url":"https://pokeapi.co/api/v2/move/258/"},{"name":"torment","url":"https://pokeapi.co/api/v2/move/259/"},{"name":"flatter","url":"https://pokeapi.co/api/v2/move/260/"},{"name":"will-o-wisp","url":"https://pokeapi.co/api/v2/move/261/"},{"name":"memento","url":"https://pokeapi.co/api/v2/move/262/"},{"name":"follow-me","url":"https://pokeapi.co/api/v2/move/266/"},{"name":"nature-power","url":"https://pokeapi.co/api/v2/move/267/"},{"name":"charge","url":"https://pokeapi.co/api/v2/move/268/"},{"name":"taunt","url":"https://pokeapi.co/api/v2/move/269/"},{"name":"helping-hand","url":"https://pokeapi.co/api/v2/move/270/"},{"name":"trick","url":"https://pokeapi.co/api/v2/move/271/"},{"name":"role-play","url":"https://pokeapi.co/api/v2/move/272/"},{"name":"wish","url":"https://pokeapi.co/api/v2/move/273/"},{"name":"assist","url":"https://pokeapi.co/api/v2/move/274/"},{"name":"ingrain","url":"https://pokeapi.co/api/v2/move/275/"},{"name":"magic-coat","url":"https://pokeapi.co/api/v2/move/277/"},{"name":"recycle","url":"https://pokeapi.co/api/v2/move/278/"},{"name":"yawn","url":"https://pokeapi.co/api/v2/move/281/"},{"name":"skill-swap","url":"https://pokeapi.co/api/v2/move/285/"},{"name":"imprison","url":"https://pokeapi.co/api/v2/move/286/"},{"name":"refresh","url":"https://pokeapi.co/api/v2/move/287/"},{"name":"grudge","url":"https://pokeapi.co/api/v2/move/288/"},{"name":"snatch","url":"https://pokeapi.co/api/v2/move/289/"},{"name":"camouflage","url":"https://pokeapi.co/api/v2/move/293/"},{"name":"tail-glow","url":"https://pokeapi.co/api/v2/move/294/"},{"name":"feather-dance","url":"https://pokeapi.co/api/v2/move/297/"},{"name":"teeter-dance","url":"https://pokeapi.co/api/v2/move/298/"},{"name":"mud-sport","url":"https://pokeapi.co/api/v2/move/300/"},{"name":"slack-off","url":"https://pokeapi.co/api/v2/move/303/"},{"name":"aromatherapy","url":"https://pokeapi.co/api/v2/move/312/"},{"name":"fake-tears","url":"https://pokeapi.co/api/v2/move/313/"},{"name":"odor-sleuth","url":"https://pokeapi.co/api/v2/move/316/"},{"name":"metal-sound","url":"https://pokeapi.co/api/v2/move/319/"},{"name":"grass-whistle","url":"https://pokeapi.co/api/v2/move/320/"},{"name":"tickle","url":"https://pokeapi.co/api/v2/move/321/"},{"name":"cosmic-power","url":"https://pokeapi.co/api/v2/move/322/"},{"name":"iron-defense","url":"https://pokeapi.co/api/v2/move/334/"},{"name":"block","url":"https://pokeapi.co/api/v2/move/335/"},{"name":"howl","url":"https://pokeapi.co/api/v2/move/336/"},{"name":"bulk-up","url":"https://pokeapi.co/api/v2/move/339/"},{"name":"water-sport","url":"https://pokeapi.co/api/v2/move/346/"},{"name":"calm-mind","url":"https://pokeapi.co/api/v2/move/347/"},{"name":"dragon-dance","url":"https://pokeapi.co/api/v2/move/349/"},{"name":"roost","url":"https://pokeapi.co/api/v2/move/355/"},{"name":"gravity","url":"https://pokeapi.co/api/v2/move/356/"},{"name":"miracle-eye","url":"https://pokeapi.co/api/v2/move/357/"},{"name":"healing-wish","url":"https://pokeapi.co/api/v2/move/361/"},{"name":"tailwind","url":"https://pokeapi.co/api/v2/move/366/"},{"name":"acupressure","url":"https://pokeapi.co/api/v2/move/367/"},{"name":"embargo","url":"https://pokeapi.co/api/v2/move/373/"},{"name":"psycho-shift","url":"https://pokeapi.co/api/v2/move/375/"},{"name":"heal-block","url":"https://pokeapi.co/api/v2/move/377/"},{"name":"power-trick","url":"https://pokeapi.co/api/v2/move/379/"},{"name":"gastro-acid","url":"https://pokeapi.co/api/v2/move/380/"},{"name":"lucky-chant","url":"https://pokeapi.co/api/v2/move/381/"},{"name":"me-first","url":"https://pokeapi.co/api/v2/move/382/"},{"name":"copycat","url":"https://pokeapi.co/api/v2/move/383/"},{"name":"power-swap","url":"https://pokeapi.co/api/v2/move/384/"},{"name":"guard-swap","url":"https://pokeapi.co/api/v2/move/385/"},{"name":"worry-seed","url":"https://pokeapi.co/api/v2/move/388/"},{"name":"toxic-spikes","url":"https://pokeapi.co/api/v2/move/390/"},{"name":"heart-swap","url":"https://pokeapi.co/api/v2/move/391/"},{"name":"aqua-ring","url":"https://pokeapi.co/api/v2/move/392/"},{"name":"magnet-rise","url":"https://pokeapi.co/api/v2/move/393/"},{"name":"rock-polish","url":"https://pokeapi.co/api/v2/move/397/"},{"name":"switcheroo","url":"https://pokeapi.co/api/v2/move/415/"},{"name":"nasty-plot","url":"https://pokeapi.co/api/v2/move/417/"},{"name":"defog","url":"https://pokeapi.co/api/v2/move/432/"},{"name":"trick-room","url":"https://pokeapi.co/api/v2/move/433/"},{"name":"captivate","url":"https://pokeapi.co/api/v2/move/445/"},{"name":"stealth-rock","url":"https://pokeapi.co/api/v2/move/446/"},{"name":"defend-order","url":"https://pokeapi.co/api/v2/move/455/"},{"name":"heal-order","url":"https://pokeapi.co/api/v2/move/456/"},{"name":"lunar-dance","url":"https://pokeapi.co/api/v2/move/461/"},{"name":"dark-void","url":"https://pokeapi.co/api/v2/move/464/"},{"name":"hone-claws","url":"https://pokeapi.co/api/v2/move/468/"},{"name":"wide-guard","url":"https://pokeapi.co/api/v2/move/469/"},{"name":"guard-split","url":"https://pokeapi.co/api/v2/move/470/"},{"name":"power-split","url":"https://pokeapi.co/api/v2/move/471/"},{"name":"wonder-room","url":"https://pokeapi.co/api/v2/move/472/"},{"name":"autotomize","url":"https://pokeapi.co/api/v2/move/475/"},{"name":"rage-powder","url":"https://pokeapi.co/api/v2/move/476/"},{"name":"telekinesis","url":"https://pokeapi.co/api/v2/move/477/"},{"name":"magic-room","url":"https://pokeapi.co/api/v2/move/478/"},{"name":"quiver-dance","url":"https://pokeapi.co/api/v2/move/483/"},{"name":"soak","url":"https://pokeapi.co/api/v2/move/487/"},{"name":"coil","url":"https://pokeapi.co/api/v2/move/489/"},{"name":"simple-beam","url":"https://pokeapi.co/api/v2/move/493/"},{"name":"entrainment","url":"https://pokeapi.co/api/v2/move/494/"},{"name":"after-you","url":"https://pokeapi.co/api/v2/move/495/"},{"name":"quick-guard","url":"https://pokeapi.co/api/v2/move/501/"},{"name":"ally-switch","url":"https://pokeapi.co/api/v2/move/502/"},{"name":"shell-smash","url":"https://pokeapi.co/api/v2/move/504/"},{"name":"heal-pulse","url":"https://pokeapi.co/api/v2/move/505/"},{"name":"shift-gear","url":"https://pokeapi.co/api/v2/move/508/"},{"name":"quash","url":"https://pokeapi.co/api/v2/move/511/"},{"name":"reflect-type","url":"https://pokeapi.co/api/v2/move/513/"},{"name":"bestow","url":"https://pokeapi.co/api/v2/move/516/"},{"name":"work-up","url":"https://pokeapi.co/api/v2/move/526/"},{"name":"cotton-guard","url":"https://pokeapi.co/api/v2/move/538/"},{"name":"mat-block","url":"https://pokeapi.co/api/v2/move/561/"},{"name":"rototiller","url":"https://pokeapi.co/api/v2/move/563/"},{"name":"sticky-web","url":"https://pokeapi.co/api/v2/move/564/"},{"name":"trick-or-treat","url":"https://pokeapi.co/api/v2/move/567/"},{"name":"noble-roar","url":"https://pokeapi.co/api/v2/move/568/"},{"name":"ion-deluge","url":"https://pokeapi.co/api/v2/move/569/"},{"name":"forests-curse","url":"https://pokeapi.co/api/v2/move/571/"},{"name":"parting-shot","url":"https://pokeapi.co/api/v2/move/575/"},{"name":"topsy-turvy","url":"https://pokeapi.co/api/v2/move/576/"},{"name":"crafty-shield","url":"https://pokeapi.co/api/v2/move/578/"},{"name":"flower-shield","url":"https://pokeapi.co/api/v2/move/579/"},{"name":"grassy-terrain","url":"https://pokeapi.co/api/v2/move/580/"},{"name":"misty-terrain","url":"https://pokeapi.co/api/v2/move/581/"},{"name":"electrify","url":"https://pokeapi.co/api/v2/move/582/"},{"name":"fairy-lock","url":"https://pokeapi.co/api/v2/move/587/"},{"name":"kings-shield","url":"https://pokeapi.co/api/v2/move/588/"},{"name":"play-nice","url":"https://pokeapi.co/api/v2/move/589/"},{"name":"confide","url":"https://pokeapi.co/api/v2/move/590/"},{"name":"spiky-shield","url":"https://pokeapi.co/api/v2/move/596/"},{"name":"aromatic-mist","url":"https://pokeapi.co/api/v2/move/597/"},{"name":"eerie-impulse","url":"https://pokeapi.co/api/v2/move/598/"},{"name":"venom-drench","url":"https://pokeapi.co/api/v2/move/599/"},{"name":"powder","url":"https://pokeapi.co/api/v2/move/600/"},{"name":"geomancy","url":"https://pokeapi.co/api/v2/move/601/"},{"name":"magnetic-flux","url":"https://pokeapi.co/api/v2/move/602/"},{"name":"happy-hour","url":"https://pokeapi.co/api/v2/move/603/"},{"name":"electric-terrain","url":"https://pokeapi.co/api/v2/move/604/"},{"name":"celebrate","url":"https://pokeapi.co/api/v2/move/606/"},{"name":"hold-hands","url":"https://pokeapi.co/api/v2/move/607/"},{"name":"baby-doll-eyes","url":"https://pokeapi.co/api/v2/move/608/"},{"name":"shore-up","url":"https://pokeapi.co/api/v2/move/659/"},{"name":"baneful-bunker","url":"https://pokeapi.co/api/v2/move/661/"},{"name":"floral-healing","url":"https://pokeapi.co/api/v2/move/666/"},{"name":"strength-sap","url":"https://pokeapi.co/api/v2/move/668/"},{"name":"spotlight","url":"https://pokeapi.co/api/v2/move/671/"},{"name":"toxic-thread","url":"https://pokeapi.co/api/v2/move/672/"},{"name":"laser-focus","url":"https://pokeapi.co/api/v2/move/673/"},{"name":"gear-up","url":"https://pokeapi.co/api/v2/move/674/"},{"name":"psychic-terrain","url":"https://pokeapi.co/api/v2/move/678/"},{"name":"speed-swap","url":"https://pokeapi.co/api/v2/move/683/"},{"name":"purify","url":"https://pokeapi.co/api/v2/move/685/"},{"name":"instruct","url":"https://pokeapi.co/api/v2/move/689/"},{"name":"aurora-veil","url":"https://pokeapi.co/api/v2/move/694/"},{"name":"extreme-evoboost","url":"https://pokeapi.co/api/v2/move/702/"},{"name":"tearful-look","url":"https://pokeapi.co/api/v2/move/715/"},{"name":"shadow-down","url":"https://pokeapi.co/api/v2/move/10012/"},{"name":"shadow-hold","url":"https://pokeapi.co/api/v2/move/10014/"},{"name":"shadow-mist","url":"https://pokeapi.co/api/v2/move/10015/"},{"name":"shadow-panic","url":"https://pokeapi.co/api/v2/move/10016/"},{"name":"shadow-shed","url":"https://pokeapi.co/api/v2/move/10017/"},{"name":"shadow-sky","url":"https://pokeapi.co/api/v2/move/10018/"}],"name":"status","names":[{"language":{"name":"ja-Hrkt","url":"https://pokeapi.co/api/v2/language/1/"},"name":"へんか"},{"language":{"name":"fr","url":"https://pokeapi.co/api/v2/language/5/"},"name":"statut"},{"language":{"name":"de","url":"https://pokeapi.co/api/v2/language/6/"},"name":"status"},{"language":{"name":"es","url":"https://pokeapi.co/api/v2/language/7/"},"name":"estado"},{"language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"},"name":"status"}]}"#

        guard let moveDamageClassData = moveDamageClassJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let moveDamageClass = try decoder.decode(MoveDamageClass.self, from: moveDamageClassData)
            XCTAssertNotNil(moveDamageClass)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(MoveDamageClass.self) Object. Error: \(error)")
        }
    }

    func testDecodingMoveLearnMethod() {
        let moveLearnMethodJSON = #"{"id":1,"name":"level-up","names":[{"name":"Level up","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}],"descriptions":[{"description":"Wird gelernt, wenn ein Pokémon ein bestimmtes Level erreicht.","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}],"version_groups":[{"name":"red-blue","url":"http://pokeapi.co/api/v2/version-group/1/"}]}"#

        guard let moveLearnMethodData = moveLearnMethodJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let moveLearnMethod = try decoder.decode(MoveLearnMethod.self, from: moveLearnMethodData)
            XCTAssertNotNil(moveLearnMethod)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(MoveLearnMethod.self) Object. Error: \(error)")
        }
    }

    func testDecodingMoveTarget() {
        let moveTargetJSON = #"{"id":1,"name":"specific-move","descriptions":[{"description":"Eine spezifische FÃ¤higkeit.  Wie diese FÃ¤higkeit genutzt wird hÃ¤ngt von den genutzten FÃ¤higkeiten ab.","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}],"moves":[{"name":"counter","url":"http://pokeapi.co/api/v2/move/68/"}],"names":[{"name":"Spezifische FÃ¤higkeit","language":{"name":"de","url":"http://pokeapi.co/api/v2/language/6/"}}]}"#

        guard let moveTargetData = moveTargetJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let moveTarget = try decoder.decode(MoveTarget.self, from: moveTargetData)
            XCTAssertNotNil(moveTarget)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(MoveTarget.self) Object. Error: \(error)")
        }
    }

    func testDecodingLocation() {
        let locationJSON = #"{"id":1,"name":"canalave-city","region":{"name":"sinnoh","url":"http://pokeapi.co/api/v2/region/4/"},"names":[{"name":"Canalave City","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"game_indices":[{"game_index":7,"generation":{"name":"generation-iv","url":"http://pokeapi.co/api/v2/generation/4/"}}],"areas":[{"name":"canalave-city-area","url":"http://pokeapi.co/api/v2/location-area/1/"}]}"#

        guard let locationData = locationJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let location = try decoder.decode(Location.self, from: locationData)
            XCTAssertNotNil(location)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(Location.self) Object. Error: \(error)")
        }
    }

    func testDecodingLocationArea() {
        let locationAreaJSON = #"{"id":1,"name":"canalave-city-area","game_index":1,"encounter_method_rates":[{"encounter_method":{"name":"old-rod","url":"http://pokeapi.co/api/v2/encounter-method/2/"},"version_details":[{"rate":25,"version":{"name":"platinum","url":"http://pokeapi.co/api/v2/version/14/"}}]}],"location":{"name":"canalave-city","url":"http://pokeapi.co/api/v2/location/1/"},"names":[{"name":"","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"pokemon_encounters":[{"pokemon":{"name":"tentacool","url":"http://pokeapi.co/api/v2/pokemon/72/"},"version_details":[{"version":{"name":"diamond","url":"http://pokeapi.co/api/v2/version/12/"},"max_chance":60,"encounter_details":[{"min_level":20,"max_level":30,"condition_values":[],"chance":60,"method":{"name":"surf","url":"http://pokeapi.co/api/v2/encounter-method/5/"}}]}]}]}"#

        guard let locationAreaData = locationAreaJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let locationArea = try decoder.decode(LocationArea.self, from: locationAreaData)
            XCTAssertNotNil(locationArea)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(LocationArea.self) Object. Error: \(error)")
        }
    }

    func testDecodingPalParkArea() {
        let palParkAreaJSON = #"{"id":1,"name":"forest","names":[{"name":"Forest","language":{"name":"en","url":"http://pokeapi.co/api/v2/language/9/"}}],"pokemon_encounters":[{"base_score":30,"rate":50,"pokemon_species":{"name":"caterpie","url":"http://pokeapi.co/api/v2/pokemon-species/10/"}}]}"#

        guard let palParkAreaData = palParkAreaJSON.data(using: .utf8) else {
            XCTFail("Failed to convert JSON Text into Data")
            return
        }

        do {
            let palParkArea = try decoder.decode(PalParkArea.self, from: palParkAreaData)
            XCTAssertNotNil(palParkArea)
        } catch {
            XCTFail("Failed to Decode JSON Data into \(PalParkArea.self) Object. Error: \(error)")
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
