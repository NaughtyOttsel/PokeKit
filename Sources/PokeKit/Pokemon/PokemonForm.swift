/// Some Pokémon may appear in one of multiple, visually different forms. These differences are purely cosmetic. For variations within a Pokémon species, which do differ in more than just visuals, the 'Pokémon' entity is used to represent such a variety
public struct PokemonForm: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The order in which forms should be sorted within all forms. Multiple forms may have equal order, in which case they should fall back on sorting by name
    public let order: Int
    /// The order in which forms should be sorted within a species' forms
    public let formOrder: Int
    /// True for exactly one form used as the default for each Pokémon
    public let isDefault: Bool
    /// Whether or not this form can only happen during battle
    public let isBattleOnly: Bool
    /// Whether or not this form requires mega evolution
    public let isMega: Bool
    /// The name of this form
    public let formName: String
    /// The Pokémon that can take on this form
    public let pokemon: NamedAPIResource
    /// A set of sprites used to depict this Pokémon form in the game
    public let sprites: PokemonFormSprites
    /// The version group this Pokémon form was introduced in.
    public let versionGroup: NamedAPIResource
    public let names: [Name]
    /// The form specific form name of this Pokémon form, or empty if the form does not have a specific name.
    public let formNames: [Name]

    private enum CodingKeys: String, CodingKey {
        case id, name, order, pokemon, sprites, names
        case formOrder = "form_order"
        case isDefault = "is_default"
        case isBattleOnly = "is_battle_only"
        case isMega = "is_mega"
        case formName = "form_name"
        case versionGroup = "version_group"
        case formNames = "form_names"
    }
}

public struct PokemonFormSprites: Decodable {
    /// The default depiction of this Pokémon form from the front in battle
    public let frontDefault: String
    /// The shiny depiction of this Pokémon form from the front in battle
    public let frontShiny: String
    /// The default depiction of this Pokémon form from the back in battle
    public let backDefault: String
    /// The shiny depiction of this Pokémon form from the back in battle
    public let backShiny: String

    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
    }
}
