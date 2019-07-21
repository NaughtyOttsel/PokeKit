

/// Encounter condition values are the various states that an encounter condition can have, i.e., Time of day can be either day or night.
public struct EncounterConditionValue: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The condition this encounter condition value pertains to
    public let condition: NamedAPIResource
    public let names: [Name]
}
