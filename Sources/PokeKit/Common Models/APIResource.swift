public struct APIResource: ResourceLocatable, Decodable {
    public let url: String
}

public struct NamedAPIResource: Named, ResourceLocatable, Decodable {
    public let name: String
    public let url: String
}
