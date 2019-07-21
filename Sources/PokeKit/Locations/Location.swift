

/// Locations that can be visited within the games. Locations make up sizable portions of regions, like cities or routes
public struct Location: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The region this location can be found in
    public let region: NamedAPIResource
    public let names: [Name]
    /// A list of game indices relevent to this location by generation
    public let gameIndicies: [GenerationGameIndex]
    /// Areas that can be found within this location
    public let areas: [NamedAPIResource]

    private enum CodingKeys: String, CodingKey {
        case id, name, region, names, areas
        case gameIndicies = "game_indices"
    }
}
