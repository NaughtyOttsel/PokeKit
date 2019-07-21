/// Moves are the skills of pokémon in battle. In battle, a Pokémon uses one move each turn. Some moves (including those learned by Hidden Machine) can be used outside of battle as well, usually for the purpose of removing obstacles or exploring new areas.
public struct Move: Localizable, Named, Identifiable, Decodable {
    public let id: Int
    public let name: String
    /// The percent value of how likely this move is to be successful
    public let accuracy: Int
    /// The percent value of how likely it is this moves effect will happen
    public let effectChance: Int?
    /// The number of times this move can be used
    public let powerPoints: Int
    /// A value between -8 and 8. Sets the order in which moves are executed during battle
    public let priority: Int
    /// The base power of this move with a value of 0 if it does not have a base power
    public let power: Int
    /// A detail of normal and super contest combos that require this move
    public let contestCombos: ContestComboSets?
    /// The type of appeal this move gives a pokémon when used in a contest
    public let contestType: NamedAPIResource
    /// The effect the move has when used in a contest
    public let contestEffect: APIResource
    /// The type of damage the move inflicts on the target, e.g. physical
    public let damageClass: NamedAPIResource
    /// The effect of this move listed in different languages
    public let effectEntries: [VerboseEffect]
    /// The list of previous effects this move has had across version groups of the games
    public let effectChanges: [AbilityEffectChange]?
    public let flavorTextEntries: [MoveFlavorText]?
    /// The generation in which this move was introduced
    public let generation: NamedAPIResource
    public let machines: [MachineVersionDetail]?
    /// Meta data about this move
    public let metaData: MoveMetaData
    public let names: [Name]
    /// A list of move resource value changes across ersion groups of the game
    public let pastValues: [PastMoveStatValues]
    /// A list of stats this moves effects and how much it effects them
    public let statChanges: [MoveStatChange]
    /// The effect the move has when used in a super contest
    public let superContestEffect: APIResource
    /// The type of target that will recieve the effects of the attack
    public let target: NamedAPIResource
    /// The elemental type of this move
    public let type: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case id, name, accuracy, priority, power, generation, machines, names, target, type
        case effectChance = "effect_chance"
        case powerPoints = "pp"
        case contestCombos = "contest_combos"
        case contestType = "contest_type"
        case contestEffect = "contest_effect"
        case damageClass = "damage_class"
        case effectEntries = "effect_entries"
        case effectChanges = "effect_changes"
        case flavorTextEntries = "flavor_text_entries"
        case metaData = "meta"
        case pastValues = "past_values"
        case statChanges = "stat_changes"
        case superContestEffect = "super_contest_effect"
    }
}

public struct ContestComboSets: Decodable {
    /// A detail of moves this move can be used before or after, granting additional appeal points in contests
    public let normal: ContestComboDetail?
    /// A detail of moves this move can be used before or after, granting additional appeal points in super contests
    public let `super`: ContestComboDetail?

    private enum CodingKeys: String, CodingKey {
        case normal
        case `super` = "super"
    }
}

public struct ContestComboDetail: Decodable {
    /// A list of moves to use before this move
    public let useBefore: [NamedAPIResource]?
    /// A list of moves to use after this move
    public let useAfter: [NamedAPIResource]?

    private enum CodingKeys: String, CodingKey {
        case useBefore = "use_before"
        case useAfter = "use_after"
    }
}

public struct MoveFlavorText: Multilingual, Decodable {
    public let flavorText: String
    public let language: NamedAPIResource
    public let versionGroup: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case language
        case flavorText = "flavor_text"
        case versionGroup = "version_group"
    }
}

public struct MoveMetaData: Decodable {
    /// The status ailment this move inflicts on its target
    public let moveAilment: NamedAPIResource
    /// The category of move this move falls under, e.g. damage or ailment
    public let category: NamedAPIResource
    /// The minimum number of times this move hits. Nil if it always only hits once.
    public let minimumNumberOfHits: Int?
    /// The maximum number of times this move hits. Nil if it always only hits once.
    public let maximumNumberOfHits: Int?
    /// The minimum number of turns this move continues to take effect. Nil if it always only lasts one turn
    public let minimumNumberOfTurns: Int?
    /// The maximum number of turns this move continues to take effect. Nil if it always only lasts one turn.
    public let maximumNumberOfTurns: Int?
    /// HP drain (if positive) or Recoil damage (if negative), in percent of damage done
    public let drain: Int
    /// The amount of hp gained by the attacking pokémon, in percent of it's maximum HP
    public let healing: Int
    /// Critical hit rate bonus
    public let criticalHitRate: Int
    /// The likelyhood this attack will cause an ailment
    public let ailmentChance: Int
    /// The likelyhood this attack will cause the target pokémon to flinch
    public let flinchChance: Int
    /// The likelyhood this attack will cause a stat change in the target pokémon
    public let statChangeChance: Int

    private enum CodingKeys: String, CodingKey {
        case category, drain, healing
        case moveAilment = "ailment"
        case minimumNumberOfHits = "min_hits"
        case maximumNumberOfHits = "max_hits"
        case minimumNumberOfTurns = "min_turns"
        case maximumNumberOfTurns = "max_turns"
        case criticalHitRate = "crit_rate"
        case ailmentChance = "ailment_chance"
        case flinchChance = "flinch_chance"
        case statChangeChance = "stat_chance"
    }
}

public struct MoveStatChange: Decodable {
    /// The amount of change
    public let change: Int
    /// The stat being affected
    public let Stat: NamedAPIResource
}

public struct PastMoveStatValues: Decodable {
    /// The percent value of how likely this move is to be successful
    public let accuracy: Int
    /// The percent value of how likely it is this moves effect will take effect
    public let effectChance: Int
    /// The base power of this move with a value of 0 if it does not have a base power
    public let power: Int
    /// The number of times this move can be used
    public let powerPoints: Int
    /// The effect of this move listed in different languages
    public let effectEntries: [VerboseEffect]
    /// The elemental type of this move
    public let type: NamedAPIResource
    /// The version group in which these move stat values were in effect
    public let versionGroup: NamedAPIResource

    private enum CodingKeys: String, CodingKey {
        case accuracy, power, type
        case effectChance = "effect_chance"
        case powerPoints = "pp"
        case effectEntries = "effect_entries"
        case versionGroup = "version_group"
    }
}
