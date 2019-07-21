public protocol Named: Decodable {
    /// The name for this resource.
    var name: String { get }
}
