/// Details on Encounters for a particular game version
public struct VersionEncounterDetail: Decodable {
    /// The game version this encounter happens in.
    public let version: NamedAPIResource
    /// The total percentage of all encounter potential.
    public let maxChance: Int
    /// A list of encounters and their specifics.
    public let encounterDetails: [Encounter]

    private enum CodingKeys: String, CodingKey {
        case version
        case maxChance = "max_chance"
        case encounterDetails = "encounter_details"
    }
}
