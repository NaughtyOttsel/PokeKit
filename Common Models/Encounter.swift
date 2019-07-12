

/// Details on an Encounter
public struct Encounter: Decodable {
    
    /// The lowest level the Pokémon could be encountered at.
    public let minimumLevel: Int
    /// The highest level the Pokémon could be encountered at.
    public let maximumLevel: Int
    /// A list of condition values that must be in effect for this encounter to occur.
    public let conditionValues: NamedAPIResource
    /// Percent chance that this encounter will occur.
    public let chance: Int
    /// The method by which this encounter happens.
    public let method: NamedAPIResource
    
    private enum CodingKeys: String, CodingKey {
        case minimumLevel = "min_level"
        case maximumLevel = "max_level"
        case conditionValues = "condition_values"
        case chance, method
    }
}
