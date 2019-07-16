

/// Mapping between the Game Index internal to the API and Game Versions
public struct VersionGameIndex: Decodable {
    /// The internal id of an API resource within game data.
    public let gameIndex: Int
    /// The version relevent to this game index.
    public let version: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case version
        case gameIndex = "game_index"
    }
}
