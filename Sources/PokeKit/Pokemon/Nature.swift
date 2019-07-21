/// Natures influence how a pokémon's stats grow
public struct Nature: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The stat decreased by 10% in pokémon with this nature
    public let decreasedStat: NamedAPIResource
    /// The stat increased by 10% in pokémon with this nature
    public let increasedStat: NamedAPIResource
    /// The flavor hated by pokémon with this nature
    public let hatesFlavor: NamedAPIResource
    /// The flavor liked by pokémon with this nature
    public let likesFlavor: NamedAPIResource
    /// A list of pokéathlon stats this nature effects and how much it effects them
    public let pokeathlonStatChanges: [NatureStatChange]
    /// A list of battle styles and how likely a pokémon with this nature is to use them in the Battle Palace or Battle Tent
    public let moveBattleStylePreferences: [MoveBattleStylePreference]
    public let names: [Name]

    private enum CodingKeys: String, CodingKey {
        case id, name, names
        case decreasedStat = "decreased_stat"
        case increasedStat = "increased_stat"
        case hatesFlavor = "hates_flavor"
        case likesFlavor = "likes_flavor"
        case pokeathlonStatChanges = "pokeathlon_stat_changes"
        case moveBattleStylePreferences = "move_battle_style_preferences"
    }
}

public struct NatureStatChange: Decodable {
    /// The amount of change
    public let maxChange: Int
    /// The stat being affected
    public let pokeathlonStat: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case maxChange = "max_change"
        case pokeathlonStat = "pokeathlon_stat"
    }
}

public struct MoveBattleStylePreference: Decodable {
    /// Chance of using the move, in percent, if HP is under one half
    public let lowHealthPreference: Int
    /// Chance of using the move, in percent, if HP is over one half
    public let highHealthPreference: Int
    /// The move battle style
    public let moveBattleStyle: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case lowHealthPreference = "low_hp_preference"
        case highHealthPreference = "high_hp_preference"
        case moveBattleStyle = "move_battle_style"
    }
}
