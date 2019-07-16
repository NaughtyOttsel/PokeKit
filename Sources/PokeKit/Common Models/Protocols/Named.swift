public protocol Named: Decodable {
    /// The name for this resource.
    var name: String { get }
}

public protocol Entity: Identifiable & Named {}

public protocol LocalizableEntity: Entity & Localizable {}
