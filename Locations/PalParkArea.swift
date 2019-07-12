
/// Areas used for grouping pokémon encounters in Pal Park. They're like habitats that are specific to Pal Park
public struct PalParkArea: LocalizableEntity, Decodable {
    
    public let id: Int
    public let name: String
    public let names: [Name]
    /// A list of pokémon encountered in thi pal park area along with details
    public let pokemonEncounters: PalParkEncounterSpecies
    
    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonEncounters = "pokemon_encounters"
    }
}

public struct PalParkEncounterSpecies: Decodable {
    
    /// The base score given to the player when this pokémon is caught during a pal park run
    public let baseScore: Int
    /// The base rate for encountering this pokémon in this pal park area
    public let rate: Int
    /// The pokémon species being encountered
    public let pokemonSpecies: NamedAPIResource
    
    private enum CodingKeys: String, CodingKey {
        case rate
        case baseScore = "base_score"
        case pokemonSpecies = "pokemon_species"
    }
}
