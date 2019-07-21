/// More detailed descriptions of an Effect
public struct VerboseEffect: MultiLanguageSupporting, Decodable {
    /// The localized effect text for an API resource in a specific language.
    public let effect: String
    /// The localized effect text in brief.
    public let shortEffect: String
    /// The language this effect is in.
    public let language: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case effect, language
        case shortEffect = "short_effect"
    }
}
