

/// Languages within the Games and the API has been localized for
public struct Language: LocalizableEntity, Decodable {
    /// The identifier for this resource.
    public let id: Int
    /// The name for this resource.
    public let name: String
    /// The two-letter code of the country where this language is spoken. Note that it is not unique.
    public let iso639: String
    /// The two-letter code of the language. Note that it is not unique.
    public let iso3166: String
    /// The name of this resource listed in different languages.
    public let names: [Name]
    /// Whether or not the games are published in this language.
    public let official: Bool
}
