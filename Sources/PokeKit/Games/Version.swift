
/// Versions of the games, e.g., Red, Blue or Yellow
public struct Version: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
    /// The version group this version belongs to.
    public let versionGroup: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case versionGroup = "version_group"
    }
}
