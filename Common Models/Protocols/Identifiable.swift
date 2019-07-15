public protocol Identifiable: Decodable {
    /// The identifier for this resource.
    var id: Int { get }
}
