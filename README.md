# PokeKit

A Swift 5 Wrapper for the [PokeApi](https://pokeapi.co)

## Installation

Currently the package is only available for [Swift Package Manager](https://swift.org/package-manager/) add the following package to your Package.swift file.

``` swift
.package(url: "https://github.com/NaughtyOttsel/PokeKit.git", .upToNextMajor(from: "1.0.0")),
```

### Usage

Currently the Package Supports Decoding JSON strings into Classes based on the PokeAPI.

``` swift
let decoder = JSONDecoder()
let abilityJsonString = // Use your favorite Networking Framework to retrieve data from the PokeAPI
guard let abilityData = abilityJsonString.data(using: .utf8) else {
return
}
let ability = try? decoder.decode(Ability.self, from: abilityData)
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
