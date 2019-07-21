/// A Name of an object in different locales.
public struct Name: Named, MultiLanguageSupporting, Decodable {
    /// The localized name for an API resource in a specific language.
    public let name: String
    /// The language this name is in.
    public let language: NamedAPIResource
}
