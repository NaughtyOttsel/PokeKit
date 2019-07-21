

/// Conditions which affect what pokémon might appear in the wild, e.g., day or night.
public struct EncounterCondition: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
    /// A list of possible values for this encounter condition
    public let values: [NamedAPIResource]
}
