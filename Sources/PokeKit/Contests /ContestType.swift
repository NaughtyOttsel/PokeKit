/// Contest types are categories judges used to weigh a pokémon's condition in pokemon contests
public struct ContestType: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The berry flavor that correlates with this contest type.
    public let berryFlavor: NamedAPIResource
    /// The name of this contest type listed in different languages.
    public let names: [ContestName]

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case berryFlavor = "berry_flavor"
    }
}

public struct ContestName: Named, MultiLanguageSupporting, Decodable {
    public let name: String
    /// The color associated with this contest's name.
    public let color: String
    /// The language that this name is in.
    public let language: NamedAPIResource
}
