

/// The effect of an API Resource
public struct Effect: Multilingual, Decodable {
    /// The localized effect text for an API resource in a specific language.
    public let effect: String
    /// The language this effect is in.
    public let language: NamedAPIResource
}
