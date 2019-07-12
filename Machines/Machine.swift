public struct Machine: Identifiable, Decodable {
    public let id: Int
    public let item: NamedAPIResource
    public let move: NamedAPIResource
    public let versionGroup: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case id, item, move
        case versionGroup = "version_group"
    }
}
