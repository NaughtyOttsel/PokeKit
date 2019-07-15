

/// Evolution chains are essentially family trees. They start with the lowest stage within a family and detail evolution conditions for each as well as pokémon they can evolve into up through the hierarchy.
public struct EvolutionChain: Identifiable, Decodable {
    public let id: Int
    /// The item that a pokémon would be holding when mating that would trigger the egg hatching a baby pokémon rather than a basic pokémon
    public let babyTriggerItem: NamedAPIResource?
    /// The base chain link object. Each link contains evolution details for a pokémon in the chain. Each link references the next pokémon in the natural evolution order.
    public let chain: ChainLink

    private enum CodingKeys: String, CodingKey {
        case id, chain
        case babyTriggerItem = "baby_trigger_item"
    }
}

public struct ChainLink: Decodable {
    /// Whether or not this link is for a baby pokémon. This would only ever be true on the base link.
    public let isBaby: Bool
    /// The pokemon species at this point in the evolution chain
    public let species: NamedAPIResource
    /// All details regarding the specific details of the referenced pokémon species evolution
    public let evolutionDetails: [EvolutionDetail]?
    /// A List of chain objects
    public let evolvesTo: [ChainLink]

    private enum CodingKeys: String, CodingKey {
        case species
        case isBaby = "is_baby"
        case evolvesTo = "evolves_to"
        case evolutionDetails = "evolution_details"
    }
}

public struct EvolutionDetail: Decodable {
    /// The item required to cause evolution this into pokémon species
    public let item: NamedAPIResource?
    /// The type of event that triggers evolution into this pokémon species
    public let trigger: NamedAPIResource
    /// The gender the evolving pokémon species must be in order to evolve into this pokémon species
    public let gender: Int?
    /// The item the evolving pokémon species must be holding during the evolution trigger event to evolve into this pokémon species
    public let heldItem: NamedAPIResource?
    /// The move that must be known by the evolving pokémon species during the evolution trigger event in order to evolve into this pokémon species
    public let knownMove: NamedAPIResource?
    /// The evolving pokémon species must know a move with this type during the evolution trigger event in order to evolve into this pokémon species
    public let knownMoveType: NamedAPIResource?
    /// The location the evolution must be triggered at
    public let location: NamedAPIResource?
    /// The minimum required level of the evolving pokémon species to evolve into this pokémon species
    public let minimumLevel: Int
    /// The minimum required level of happiness the evolving pokémon species to evolve into this pokémon species
    public let minimumHappiness: Int?
    /// The minimum required level of beauty the evolving pokémon species to evolve into this pokémon species
    public let minimumBeauty: Int?
    /// The minimum required level of affection the evolving pokémon species to evolve into this pokémon species
    public let minimumAffection: Int?
    /// Whether or not it must be raining in the overworld to cause evolution this pokémon species
    public let needsOverworldRain: Bool
    /// The pokémon species that must be in the players party in order for the evolving pokémon species to evolve into this pokémon species
    public let partySpecies: NamedAPIResource?
    /// The player must have a pokémon of this type in their party during the evolution trigger event in order for the evolving pokémon species to evolve into this pokémon species
    public let partyType: NamedAPIResource?
    /// The required relation between the Pokémon's Attack and Defense stats
    public let relativePhysicalStats: RelativeStats?
    /// The required time of day. Day or night
    public let timeOfDay: String
    /// Pokémon species for which this one must be traded
    public let tradeSpecies: NamedAPIResource?
    /// Whether or not the 3DS needs to be turned upside-down as this Pokémon levels up
    public let turnUpsideDown: Bool

    private enum CodingKeys: String, CodingKey {
        case item, trigger, gender, location
        case heldItem = "held_item"
        case knownMove = "known_move"
        case knownMoveType = "known_move_type"
        case minimumLevel = "min_level"
        case minimumHappiness = "min_happiness"
        case minimumBeauty = "min_beauty"
        case minimumAffection = "min_affection"
        case needsOverworldRain = "needs_overworld_rain"
        case partySpecies = "party_species"
        case partyType = "party_type"
        case relativePhysicalStats = "relative_physical_stats"
        case timeOfDay = "time_of_day"
        case tradeSpecies = "trade_species"
        case turnUpsideDown = "turn_upside_down"
    }
}

/// The required relation between the Pokémon's Attack and Defense stats
public enum RelativeStats: Int, Decodable {
    /// Attack > Defense
    case AttackGreaterDefence = 1
    /// Attack = Defense
    case AttackEqualDefence = 0
    /// Attack < Defense
    case AttackLowerDefence = -1
}
