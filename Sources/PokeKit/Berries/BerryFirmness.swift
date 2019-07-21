public struct BerryFirmness: Localizable, Named, Identifiable, Decodable {
    /// The identifier for this resource.
    public let id: Int
    /// The name for this resource.
    public let name: String
    /// A list of the berries with this firmness``
    public let berries: [NamedAPIResource]
    /// The name of this resource listed in different languages.
    public let names: [Name]
}
