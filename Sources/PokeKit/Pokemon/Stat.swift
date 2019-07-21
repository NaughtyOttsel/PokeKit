

/// Stats determine certain aspects of battles. Each Pokémon has a value for each stat which grows as they gain levels and can be altered momentarily by effects in battles
public struct Stat: LocalizableNamedEntity, Decodable {
    public let id: Int
    public let name: String
    /// ID the games use for this stat
    public let gameIndex: Int
    /// Whether this stat only exists within a battle
    public let isBattleStatOnly: Bool
    /// A detail of moves which affect this stat positively or negatively.
    public let affectingMoves: MoveStatAffectSets
    /// A detail of natures which affect this stat positively or negatively.
    public let affectingNatures: NatureStatAffectSets
    /// A list of characteristics that are set on a Pokémon when its highest base stat is this stat.
    public let characteristics: [APIResource]
    /// The class of damage this stat is directly related to
    public let moveDamageClass: NamedAPIResource?
    public let names: [Name]

    private enum CodingKeys: String, CodingKey {
        case id, name, names, characteristics
        case gameIndex = "game_index"
        case isBattleStatOnly = "is_battle_only"
        case affectingMoves = "affecting_moves"
        case affectingNatures = "affecting_natures"
        case moveDamageClass = "move_damage_class"
    }
}

public struct MoveStatAffectSets: Decodable {
    /// A list of moves and how they change the referenced stat
    public let increase: [MoveStatAffect]
    /// A list of moves and how they change the referenced stat
    public let decrease: [MoveStatAffect]
}

public struct MoveStatAffect: Decodable {
    /// The maximum amount of change to the referenced stat
    public let change: Int
    /// The move causing the change
    public let move: NamedAPIResource
}

public struct NatureStatAffectSets: Decodable {
    /// A list of natures and how they change the referenced stat
    public let increase: [NamedAPIResource]
    /// A list of nature sand how they change the referenced stat.
    public let decrease: [NamedAPIResource]
}
