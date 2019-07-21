

/// Targets moves can be directed at during battle. Targets can be Pokémon, environments or even other moves.
public struct MoveTarget: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The description of this move target listed in different languages
    public let descriptions: [Description]
    /// A list of moves that that are directed at this target
    public let moves: [NamedAPIResource]
    public let names: [Name]
}
