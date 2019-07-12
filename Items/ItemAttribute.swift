
/// Item attributes define particular aspects of items, e.g. "usable in battle" or "consumable".
public struct ItemAttribute: LocalizableEntity, Decodable {
    
    public let id: Int
    public let name: String
    /// A list of items that have this attribute
    public let items: [NamedAPIResource]
    public let names: [Name]
    /// The description of this item attribute listed in different languages
    public let descriptions: [Description]
}
