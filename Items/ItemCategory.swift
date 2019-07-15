

/// Item categories determine where items will be placed in the players bag
public struct ItemCategory: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    /// A list of items that are part of this category.
    public let items: [NamedAPIResource]
    public let names: [Name]
    /// The pocket items in this category would be put in
    public let pocket: NamedAPIResource
}
