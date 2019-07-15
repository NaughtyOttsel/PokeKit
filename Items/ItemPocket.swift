

/// Pockets within the players bag used for storing items by category
public struct ItemPocket: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    /// The Item Categories this pocket holds.
    public let categories: [NamedAPIResource]
    /// The name of this resource listed in different languages
    public let names: [Name]
}
