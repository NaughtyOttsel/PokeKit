
/// Details on the flavor of an API Resource, localized.
public struct FlavorText: Multilingual, Decodable {
    /// The localized flavor text for an API resource in a specific language.
    public let flavorText: String
    /// The language this name is in.
    public let language: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}
