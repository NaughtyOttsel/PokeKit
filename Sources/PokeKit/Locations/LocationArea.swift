

/// Location areas are sections of areas, such as floors in a building or cave. Each area has its own set of possible pokemon encounters.
public struct LocationArea: LocalizableNamedEntity, Decodable {
    public let id: Int
    public let name: String
    /// The internal id of an api resource within game data
    public let gameIndex: Int
    /// A list of methods in which pokémon may be encountered in this area and how likely the method will occur depending on the version of the game
    public let encounterMethodRates: [EncounterMethodRate]
    /// The region this location can be found in
    public let location: NamedAPIResource
    public let names: [Name]
    /// A list of pokémon that can be encountered in this area along with version specific details about the encounter
    public let pokemonEncounters: [PokemonEncounter]

    private enum CodingKeys: String, CodingKey {
        case id, name, location, names
        case gameIndex = "game_index"
        case encounterMethodRates = "encounter_method_rates"
        case pokemonEncounters = "pokemon_encounters"
    }
}

public struct EncounterMethodRate: Decodable {
    /// The method in which pokémon may be encountered in an area.
    public let encounterMethod: NamedAPIResource
    /// The chance of the encounter to occur on a version of the game
    public let versionDetails: [EncounterVersionDetails]

    private enum CodingKeys: String, CodingKey {
        case encounterMethod = "encounter_method"
        case versionDetails = "version_details"
    }
}

public struct EncounterVersionDetails: Decodable {
    /// The chance of an encounter to occur
    public let rate: Int
    /// The version of the game in which the encounter can occur with the given chance.
    public let version: NamedAPIResource
}

public struct PokemonEncounter: Decodable {
    /// The pokémon being encountered
    public let pokemon: NamedAPIResource
    /// A list of versions and encounters with pokémon that might happen in the referenced location area
    public let versionDetails: [VersionEncounterDetail]

    private enum CodingKeys: String, CodingKey {
        case pokemon
        case versionDetails = "version_details"
    }
}
