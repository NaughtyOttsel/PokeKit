/// Very general categories that loosely group move effects
public struct MoveCategory: Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// A list of moves that fall into this category
    public let moves: [NamedAPIResource]
    /// The description of this resource listed in different languages
    public let descriptions: [Description]
}
