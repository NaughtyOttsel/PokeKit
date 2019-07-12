public protocol ResourceLocatable: Decodable {
    /// The URL of the referenced resource.
    var url: String { get }
}

internal protocol _APIResource: ResourceLocatable {}

internal protocol _NamedAPIResource: Named & ResourceLocatable {}
