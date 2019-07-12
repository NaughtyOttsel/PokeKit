
/// Pokémon are the creatures that inhabit the world of the pokemon games. They can be caught using pokéballs and trained by battling with other pokémon
public struct Pokemon: Entity, Decodable {
    
    public let id: Int
    public let name: String
    /// The base experience gained for defeating this pokémon
    public let baseExperience: Int
    /// The height of this pokémon (In Decimeters)
    public let height: Int
    /// Set for exactly one pokémon used as the default for each species
    public let isDefault: Bool
    /// Order for sorting. Almost national order, except families are grouped together
    public let order: Int
    /// The mass of this pokémon (In Hectograms)
    public let weight: Int
    /// A list of abilities this pokémon could potentially have
    public let abilities: [PokemonAbility]
    /// A list of forms this pokémon can take on
    public let forms: [NamedAPIResource]
    /// A list of game indices relevent to pokémon item by generation
    public let gameIndicies: [VersionGameIndex]
    /// A list of items this pokémon may be holding when encountered
    public let heldItems: [PokemonHeldItem]
    /// A list of location areas as well as encounter details pertaining to specific versions
    public let locationAreaEncounters: String
    /// A list of moves along with learn methods and level details pertaining to specific version groups
    public let moves: [PokemonMove]
    /// A set of sprites used to depict this Pokémon in the game
    public let sprites: [PokemonSprites]
    /// The species this pokémon belongs to
    public let species: NamedAPIResource
    /// A list of base stat values for this pokémon
    public let stats: [PokemonStat]
    /// A list of details showing types this pokémon has
    public let types: [PokemonType]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, height, order, weight, abilities, forms, moves, sprites, species, stats, types
        case baseExperience = "base_experience"
        case isDefault = "is_default"
        case gameIndicies = "game_indicies"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
    }
}

public struct PokemonAbility: Decodable {
    
    /// Whether or not this is a hidden ability
    public let isHidden: Bool
    /// The slot this ability occupies in this pokémon species
    public let slot: Int
    /// The ability the pokémon may have
    public let ability: NamedAPIResource
    
    private enum CodingKeys: String, CodingKey {
        case slot, ability
        case isHidden = "is_hidden"
    }
}

public struct PokemonType: Decodable {
    
    /// The order the pokémon types are listed in
    public let slot: Int
    /// The type the referenced pokémon has
    public let type: NamedAPIResource
}

public struct PokemonHeldItem: Decodable {
    
    /// The item the referenced Pokémon holds
    public let item: NamedAPIResource
    /// The details of the different versions in which the item is held
    public let versionDetails: [PokemonHeldItemVersion]
    
    private enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}

public struct PokemonHeldItemVersion: Decodable {
    
    /// The version in which the item is held
    public let version: NamedAPIResource
    /// How often the item is held
    public let rarity: Int
}

public struct PokemonMove: Decodable {
    
    /// The move the Pokémon can learn
    public let move: NamedAPIResource
    /// The details of the version in which the Pokémon can learn the move
    public let versionGroupDetails: [PokemonMoveVersion]
    
    private enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

public struct PokemonMoveVersion: Decodable {
    
    /// The method by which the move is learned
    public let moveLearnMethod: NamedAPIResource
    /// The version group in which the move is learned
    public let versionGroup : NamedAPIResource
    /// The minimum level to learn the move
    public let levelLearnedAt: Int
    
    private enum CodingKeys: String, CodingKey {
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
        case levelLearnedAt = "level_learned_at"
    }
}

public struct PokemonStat: Decodable {
    
    /// The stat the Pokémon has
    public let stat: NamedAPIResource
    /// The effort points (EV) the Pokémon has in the stat
    public let effort: Int
    /// The base value of the stat
    public let baseStatValue: Int
    
    private enum CodingKeys: String, CodingKey {
        case stat, effort
        case baseStatValue = "base_stat"
    }
}

public struct PokemonSprites: Decodable {
    
    /// The default depiction of this Pokémon from the front in battle
    public let frontDefault: String
    /// The shiny depiction of this Pokémon from the front in battle
    public let frontShiny: String
    /// The female depiction of this Pokémon from the front in battle
    public let frontFemale: String
    /// The shiny female depiction of this Pokémon from the front in battle
    public let frontShinyFemale: String
    /// The default depiction of this Pokémon from the back in battle
    public let backDefault: String
    /// The shiny depiction of this Pokémon from the back in battle
    public let backShiny: String
    /// The female depiction of this Pokémon from the back in battle
    public let backFemale: String
    /// The shiny female depiction of this Pokémon from the back in battle
    public let backShinyFemale: String
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "font_default"
        case frontShiny = "front_shiny"
        case frontFemale = "front_female"
        case frontShinyFemale = "front_female_shiny"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backFemale = "back_female"
        case backShinyFemale = "back_female_shiny"
    }
}

public struct LocationAreaEncounter: Decodable {
    
    /// The location area the referenced pokémon can be encountered in
    public let locationArea: NamedAPIResource
    /// A list of versions and encounters with the referenced pokémon that might happen
    public let versionDetails: [VersionEncounterDetail]
    
    private enum CodingKeys: String, CodingKey {
        case locationArea = "location_area"
        case versionDetails = "version_details"
    }
}
