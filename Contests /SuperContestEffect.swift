
/// Super contest effects refer to the effects of moves when used in super contests
public struct SuperContestEffect: Identifiable, Decodable {
    public let id: Int
    /// The level of appeal this super contest effect has
    public let appeal: Int
    /// The flavor text of this super contest effect listed in different languages
    public let flavorTextEntries: [FlavorText]
    /// A list of moves that have the effect when used in super contests
    public let moves: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, appeal, moves
        case flavorTextEntries = "flavor_text_entries"
    }
}
