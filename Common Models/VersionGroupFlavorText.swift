
/// Localized Flavor Text for a specific Version Group
public struct VersionGroupFlavorText: Multilingual, Decodable {
    /// The localized name for an API resource in a specific language.
    public let text: String
    /// The language this name is in.
    public let language: NamedAPIResource
    /// The version group which uses this flavor text.
    public let versionGroup: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case text, language
        case versionGroup = "version_group"
    }
}
