
/// Version groups categorize highly similar versions of the games
public struct VersionGroup: Entity, Decodable {
    
    public let id: Int
    public let name: String
    /// Order for sorting. Almost by date of release, except similar versions are grouped together
    public let order: Int
    /// The generation this version was introduced in.
    public let generation: NamedAPIResource
    /// A list of methods in which Pokémon can learn moves in this version group
    public let moveLearnMethods: [NamedAPIResource]
    /// A list of Pokédexes introduces in this version group
    public let pokedexes: [NamedAPIResource]
    /// A list of regions that can be visited in this version group.
    public let regions: [NamedAPIResource]
    /// The versions this version group owns.
    public let versions: [NamedAPIResource]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, order, generation, pokedexes, regions, versions
        case moveLearnMethods = "move_learn_methods"
    }
}
