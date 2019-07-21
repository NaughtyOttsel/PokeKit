

/// An item is an object in the games which the player can pick up, keep in their bag, and use in some manner. They have various uses, including healing, powering up, helping catch Pokémon, or to access a new area.
public struct Item: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The price of this item in stores
    public let cost: Int
    /// The power of the move Fling when used with this item
    public let flingPower: Int?
    /// The effect of the move Fling when used with this item
    public let flingEffect: NamedAPIResource?
    /// A list of attributes this item has.
    public let attributes: [NamedAPIResource]
    /// The category of items this item falls into.
    public let category: NamedAPIResource
    /// The effect of this ability listed in different languages
    public let effectEntries: [VerboseEffect]
    /// The flavor text of this ability listed in different languages
    public let flavorTextEntries: [VersionGroupFlavorText]
    /// A list of game indices relevent to this item by generation
    public let gameIndicies: [GenerationGameIndex]?
    /// The name of this item listed in different languages
    public let names: [Name]
    /// A set of sprites used to depict this item in the game
    public let sprites: ItemSprites?
    /// A list of Pokémon that might be found in the wild holding this item.
    public let heldByPokemon: [ItemHolderPokemon]
    /// An evolution chain this item requires to produce a bay during mating
    public let babyTriggerFor: APIResource?
    /// A list of the machines related to this item
    public let machines: [MachineVersionDetail]?

    private enum CodingKeys: String, CodingKey {
        case id, name, cost, attributes, category, names, sprites, machines
        case flingPower = "fling_power"
        case flingEffect = "fling_effect"
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case gameIndicies = "game_indicies"
        case heldByPokemon = "held_by_pokemon"
        case babyTriggerFor = "baby_trigger_for"
    }
}

public struct ItemSprites: Decodable {
    /// The default depiction of this item
    public let `default`: String

    private enum CodingKeys: String, CodingKey {
        case `default` = "default"
    }
}

public struct ItemHolderPokemon: Decodable {
    /// The Pokémon that holds this item
    public let pokemon: NamedAPIResource
    /// The details for the version that this item is held in by the Pokémon
    public let versionDetails: [ItemHolderPokemonVersionDetail]

    private enum CodingKeys: String, CodingKey {
        case pokemon
        case versionDetails = "version_details"
    }
}

/// The details for the version that an item is held in by a Pokémon
public struct ItemHolderPokemonVersionDetail: Decodable {
    /// How often this Pokémon holds this item in this version
    public let rarity: Int
    /// The version that this item is held in by the Pokémon
    public let version: NamedAPIResource
}
