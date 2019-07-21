

/// A Pokémon Species forms the basis for at least one Pokémon. Attributes of a Pokémon species are shared across all varieties of Pokémon within the species. A good example is Wormadam; Wormadam is the species which can be found in three different varieties, Wormadam-Trash, Wormadam-Sandy and Wormadam-Plant.
public struct PokemonSpecies: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
    /// The order in which species should be sorted. Based on National Dex order, except families are grouped together and sorted by stage.
    public let order: Int
    /// The chance of this Pokémon being female, in eighths; or -1 for genderless
    public let genderRate: Int
    /// The base capture rate; up to 255. The higher the number, the easier the catch
    public let captureRate: Int
    /// The happiness when caught by a normal Pokéball; up to 255. The higher the number, the happier the Pokémon
    public let baseHappiness: Int
    /// Whether or not this is a baby Pokémon
    public let isBaby: Bool
    /// Initial hatch counter: one must walk 255 × (hatch_counter + 1) steps before this Pokémon's egg hatches, unless utilizing bonuses like Flame Body's.
    public let hatchCounter: Int
    /// Whether or not this Pokémon has visual gender differences
    public let hasGenderDifferences: Bool
    /// Whether or not this Pokémon has multiple forms and can switch between them
    public let switchableForms: Bool
    /// The rate at which this Pokémon species gains levels
    public let growthRate: NamedAPIResource
    /// A list of Pokedexes and the indexes reserved within them for this Pokémon species.
    public let pokedexNumbers: [PokemonSpeciesDexEntry]
    /// A list of egg groups this Pokémon species is a member of
    public let eggGroups: [NamedAPIResource]
    /// The color of this Pokémon for Pokédex search
    public let color: NamedAPIResource
    /// The shape of this Pokémon for Pokédex search
    public let shape: NamedAPIResource
    /// The Pokémon species that evolves into this PokemonSpecies
    public let evolvesFrom: NamedAPIResource?
    /// The evolution chain this Pokémon species is a member of
    public let evolutionChain: APIResource
    /// The habitat this Pokémon species can be encountered in
    public let habitat: NamedAPIResource
    /// The generation this Pokémon species was introduced in
    public let generation: NamedAPIResource
    /// A list of encounters that can be had with this Pokémon species in pal park
    public let palParkEncounters: [PalParkEncounterArea]
    /// A list of flavor text entries for this Pokémon species
    public let flavorTextEntries: [FlavorText]
    /// Descriptions of different forms Pokémon take on within the Pokémon species
    public let formDescriptions: [Description]
    /// The genus of this Pokémon species listed in multiple languages
    public let genera: [Genus]
    /// A list of the Pokémon that exist within this Pokémon species
    public let varieties: [PokemonSpeciesVariety]

    private enum CodingKeys: String, CodingKey {
        case id, name, names, order, color, shape, habitat, generation, genera, varieties
        case genderRate = "gender_rate"
        case captureRate = "capture_rate"
        case baseHappiness = "base_happiness"
        case isBaby = "is_baby"
        case hatchCounter = "hatch_counter"
        case hasGenderDifferences = "has_gender_differences"
        case switchableForms = "forms_switchable"
        case growthRate = "growth_rate"
        case pokedexNumbers = "pokedex_numbers"
        case eggGroups = "egg_groups"
        case evolvesFrom = "evolves_from_species"
        case evolutionChain = "evolution_chain"
        case palParkEncounters = "pal_park_encounters"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
    }
}

public struct Genus: MultiLanguageSupporting, Decodable {
    /// The localized genus for the referenced Pokémon species
    public let genus: String
    /// The language this genus is in
    public let language: NamedAPIResource
}

public struct PokemonSpeciesDexEntry: Decodable {
    /// The index number within the Pokédex
    public let entryNumber: Int
    /// The Pokédex the referenced Pokémon species can be found in
    public let pokedex: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case pokedex
        case entryNumber = "entry_number"
    }
}

public struct PalParkEncounterArea: Decodable {
    /// The base score given to the player when the referenced Pokémon is caught during a pal park run
    public let baseScore: Int
    /// The base rate for encountering the referenced Pokémon in this pal park area
    public let rate: Int
    /// The pal park area where this encounter happens
    public let area: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case rate, area
        case baseScore = "base_score"
    }
}

public struct PokemonSpeciesVariety: Decodable {
    /// Whether this variety is the default variety
    public let isDefault: Bool
    /// The Pokémon variety
    public let pokemon: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case pokemon
        case isDefault = "is_default"
    }
}
