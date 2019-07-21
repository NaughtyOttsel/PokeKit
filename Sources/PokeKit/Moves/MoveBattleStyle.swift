

/// Styles of moves when used in the Battle Palace
public struct MoveBattleStyle: LocalizableNamedEntity, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
}
