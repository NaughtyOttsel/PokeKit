

/// Pokéathlon Stats are different attributes of a pokémon's performance in pokeathlons. In Pokéathlons, competitions happen on different courses; one for each of the different pokeathlon stats
public struct PokeathlonStat: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    public let names: [Name]
    /// A detail of natures which affect this pokéathlon stat positively or negatively
    public let affectingNatures: NaturePokeathlonStatAffectSets

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case affectingNatures = "affecting_natures"
    }
}

public struct NaturePokeathlonStatAffectSets: Decodable {
    /// A list of natures and how they change the referenced pokéathlon stat
    public let increase: [NaturePokeathlonStatAffect]
    /// A list of natures and how they change the referenced pokéathlon stat
    public let decrease: [NaturePokeathlonStatAffect]
}

public struct NaturePokeathlonStatAffect: Decodable {
    /// The maximum amount of change to the referenced pokéathlon stat
    public let maxChange: Int
    /// The nature causing the change
    public let nature: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case nature
        case maxChange = "max_change"
    }
}
