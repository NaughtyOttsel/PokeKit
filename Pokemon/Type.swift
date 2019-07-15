

/// Types are properties for Pokémon and their moves. Each type has three properties: which types of Pokémon it is super effective against, which types of Pokémon it is not very effective against, and which types of Pokémon it is completely ineffective against
public struct Type: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    /// A detail of how effective this type is toward others and vice versa
    public let damageRelations: TypeRelations
    /// A list of game indices relevent to this item by generation
    public let gameIndicies: [GenerationGameIndex]?
    /// The generation this type was introduced in
    public let generationIntroduced: NamedAPIResource
    /// The class of damage inflicted by this type
    public let moveDamageClass: NamedAPIResource
    public let names: [Name]
    /// A list of details of Pokémon that have this typ
    public let pokemon: [TypePokemon]
    /// A list of moves that have this type
    public let moves: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, names, pokemon, moves
        case damageRelations = "damage_relations"
        case gameIndicies = "game_indicies"
        case generationIntroduced = "generation"
        case moveDamageClass = "move_damage_class"
    }
}

public struct TypePokemon: Decodable {
    /// The order the Pokémon's types are listed in
    public let slot: Int
    /// The Pokémon that has the referenced type
    public let pokemon: NamedAPIResource
}

public struct TypeRelations: Decodable {
    /// A list of types this type has no effect on
    public let noDamageTo: [NamedAPIResource]
    /// A list of types this type is not very effect against
    public let halfDamageTo: [NamedAPIResource]
    /// A list of types this type is very effect against.
    public let doubleDamageTo: [NamedAPIResource]
    /// A list of types that have no effect on this type.
    public let noDamageFrom: [NamedAPIResource]
    /// A list of types that are not very effective against this type
    public let halfDamageFrom: [NamedAPIResource]
    /// A list of types that are very effective against this type.
    public let doubleDamageFrom: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case noDamageTo = "no_damage_to"
        case halfDamageTo = "half_damage_to"
        case doubleDamageTo = "double_damage_to"
        case noDamageFrom = "no_damage_from"
        case halfDamageFrom = "half_damage_from"
        case doubleDamageFrom = "double_damage_from"
    }
}
