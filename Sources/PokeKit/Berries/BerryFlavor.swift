

/// Flavors determine whether a pokemon will benefit or suffer from eating a berry based on their nature.
public struct BerryFlavor: Localizable, Named, Identifiable, Decodable {
    /// The identifier for this resource.
    public let id: Int
    /// The name for this resource.
    public let name: String
    /// A list of the berries with this flavor.
    public let berries: [FlavorBerryMap]
    /// The contest type that correlates with this berry flavor.
    public let contestType: NamedAPIResource
    /// The name of this resource listed in different languages.
    public let names: [Name]

    private enum CodingKeys: String, CodingKey {
        case id, name, berries, names
        case contestType = "contest_type"
    }
}

public struct FlavorBerryMap: Decodable {
    /// How powerful the referenced flavor is for this berry.
    public let potency: Int
    /// The berry with the referenced flavor.
    public let berry: NamedAPIResource
}
