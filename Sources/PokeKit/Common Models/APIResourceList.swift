public protocol ResourceList: Decodable {
    var count: Int { get }
    var next: String { get }
    var previous: Bool { get }
}

public protocol ResourceLocatableList: ResourceList {
    associatedtype Resource: ResourceLocatable
    var results: [Resource] { get }
}

public protocol NamedResourceLocatableList: ResourceList {
    associatedtype Resource: Named & ResourceLocatable
    var results: [Resource] { get }
}

public struct APIResourceList: ResourceLocatableList {
    public let count: Int
    public let next: String
    public let previous: Bool
    public let results: [APIResource]
}

public struct NamedAPIResourceList: NamedResourceLocatableList {
    public let count: Int
    public let next: String
    public let previous: Bool
    public let results: [NamedAPIResource]
}
