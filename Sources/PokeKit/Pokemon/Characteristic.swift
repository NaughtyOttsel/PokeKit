/// Characteristics indicate which stat contains a Pokémon's highest IV. A Pokémon's Characteristic is determined by the remainder of its highest IV divided by 5 (modulo)
public struct Characteristic: Identifiable, Decodable {
    public let id: Int
    /// The remainder of the highest stat/IV divided by 5.
    public let modulo: Int
    /// The possible values of the highest stat that would result in a Pokémon recieving this characteristic when divided by 5.
    public let possibleIVs: [Int]

    private enum CodingKeys: String, CodingKey {
        case id
        case modulo = "gene_modulo"
        case possibleIVs = "possible_values"
    }
}
