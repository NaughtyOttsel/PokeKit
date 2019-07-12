
/// Methods by which the player might can encounter pokémon in the wild, e.g., walking in tall grass
public struct EncounterMethod: LocalizableEntity, Decodable {
    public let id: Int
    public let name: String
    /// A good value for sorting
    public let order: Int
    public let names: [Name]
}
