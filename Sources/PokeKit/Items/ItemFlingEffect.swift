

/// The various effects of the move "Fling" when used with different items.
public struct ItemFlingEffect: Entity, Decodable {
    public let id: Int
    public let name: String
    /// The result of this fling effect listed in different languages
    public let effectEntries: [Effect]
    /// A list of items that have this fling effect
    public let items: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, items
        case effectEntries = "effect_entries"
    }
}
