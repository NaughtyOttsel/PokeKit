
/// Move Ailments are status conditions caused by moves used during battle
public struct MoveAilment: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    /// A list of moves that cause this ailment
    public let moves: [NamedAPIResource]
    public let names: [Name]
}
