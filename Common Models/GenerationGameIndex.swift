
/// Mapping between the API Game Index and Generations.
public struct GenerationGameIndex: Decodable {
    
    /// The internal id of an API resource within game data.
    public let gameIndex: Int
    /// The generation relevent to this game index.
    public let generation: NamedAPIResource
    
    private enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
    }
}
