/// Indicates that a type implementing this protocol has support for different languages.
public protocol MultiLanguageSupporting: Decodable {
    /// The language this resource is in.
    var language: NamedAPIResource { get }
}

/// A Type implementing this protocol is `Localizable` supporting different languages.
public protocol Localizable: Decodable {
    associatedtype NamedMultiLanguageSupporting: Named & MultiLanguageSupporting

    /// The name of this resource listed in different languages
    var names: [NamedMultiLanguageSupporting] { get }
}
