// TODO: Multilingual doesn't follow the naming conventions of Protocol, need to find a better name for this protocol.
public protocol Multilingual: Decodable {
    /// The language this resource is in.
    var language: NamedAPIResource { get }
}

public protocol Localizable: Decodable {
    associatedtype NamedMultilingual: Named & Multilingual

    /// The name of this resource listed in different languages
    var names: [NamedMultilingual] { get }
}
