
/// A description of a Resource
public struct Description: Multilingual, Decodable {
    
    /// The localized description for an API resource in a specific language.
    public let description: String
    /// The language this name is in.
    public let language: NamedAPIResource
}
