
public struct APIResource: _APIResource, Decodable {
    public let url: String
}

public struct NamedAPIResource: _NamedAPIResource , Decodable {
    public let name: String
    public let url: String
}
