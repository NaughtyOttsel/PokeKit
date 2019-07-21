
/// A resource that can be located via a url.
public protocol ResourceLocatable: Decodable {
    /// The URL of the referenced resource.
    var url: String { get }
}
