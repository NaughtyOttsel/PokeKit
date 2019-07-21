public protocol Named: Decodable {
    /// The name for this resource.
    var name: String { get }
}

public protocol NamedEntity: Identifiable & Named {}

public protocol LocalizableNamedEntity: NamedEntity & Localizable {}
