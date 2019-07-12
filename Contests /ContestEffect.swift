
/// Contest effects refer to the effects of moves when used in contests
public struct ContestEffect: Identifiable, Decodable {
    public let id: Int
    /// The base number of hearts the user of this move gets
    public let appeal: Int
    /// The base number of hearts the user's opponent loses
    public let jam: Int
    /// The result of this contest effect listed in different languages
    public let effectEntries: [Effect]
    /// The flavor text of this contest effect listed in different languages
    public let flavorTextEntries: [FlavorText]
    
    private enum CodingKeys: String, CodingKey {
        case id, appeal, jam
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
    }
}
