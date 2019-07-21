

/// Details on the flavor of an API Resource, localized.
public struct FlavorText: MultiLanguageSupporting, Decodable {
    /// The localized flavor text for an API resource in a specific language.
    public let flavorText: String
    /// The language this name is in.
    public let language: NamedAPIResource

    public let versionGroup: NamedAPIResource?

    private enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case versionGroup = "version_group"
        case language
    }
}
