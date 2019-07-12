
/// Details on Machines in different Versions.
public struct MachineVersionDetail: Decodable {
    
    /// The machine that teaches a move from an item.
    public let machine: APIResource
    /// The version group of this specific machine
    public let versionGroup: NamedAPIResource
    
    private enum CodingKeys: String, CodingKey {
        case machine
        case versionGroup = "version_group"
    }
}
