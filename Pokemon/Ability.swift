
/// Abilities provide passive effects for pokémon in battle or in the overworld. Pokémon have mutiple possible abilities but can have only one ability at a time
public struct Ability: LocalizableEntity, Decodable {
    
    public let id: Int
    public let name: String
    /// Whether or not this ability originated in the main series of the video games
    public let isMainSeries: Bool
    /// The generation this ability originated in
    public let generation: NamedAPIResource
    public let names: [Name]
    /// The effect of this ability listed in different languages
    public let effectEntries: [VerboseEffect]
    /// The list of previous effects this ability has had across version groups
    public let effectChanges: [AbilityEffectChange]
    /// The flavor text of this ability listed in different languages
    public let flavorTextEntries: [AbilityFlavorText]
    /// A list of pokémon that could potentially have this ability
    public let pokemon: AbilityPokemon
    
    private enum CodingKeys: String, CodingKey {
        case id, name, generation, names, pokemon
        case isMainSeries = "is_main_series"
        case effectEntries = "effect_entries"
        case effectChanges = "effect_changes"
        case flavorTextEntries = "flavor_text_entries"
    }
    
}

public struct AbilityEffectChange: Decodable {
    
    /// The previous effect of this ability listed in different languages
    public let effectEntries: [Effect]
    /// The version group in which the previous effect of this ability originated
    public let versionGroup: NamedAPIResource
    
    private enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case versionGroup = "version_group"
    }
}

public struct AbilityFlavorText: Multilingual, Decodable {
    
    /// The localized name for an api resource in a specific language
    public let flavorText: String
    public let language: NamedAPIResource
    /// The version group that uses this flavor text
    public let versionGroup: NamedAPIResource
    
    private enum CodingKeys: String, CodingKey {
        case language
        case flavorText = "flavor_text"
        case versionGroup = "version_group"
    }
}

public struct AbilityPokemon: Decodable {
    
    /// Whether or not this a hidden ability for the referenced pokémon
    public let isHidden: Bool
    /// Pokémon have 3 ability 'slots' which hold references to possible abilities they could have. This is the slot of this ability for the referenced pokémon
    public let slot: Int
    /// The pokémon this ability could belong to
    public let pokemon: NamedAPIResource
    
    private enum CodingKeys: String, CodingKey {
        case slot, pokemon
        case isHidden = "is_hidden"
    }
}
