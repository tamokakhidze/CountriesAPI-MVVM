import Foundation

struct Country: Codable {
    let altSpellings: [String]?
    let region: String?
    let independent: Bool?
    let borders: [String]?
    let flags: Flags?
    let maps: Maps?
    let capital: [String]?
    let name: Name?
    let startOfWeek: String?
}

struct Name: Codable {
    let common: String
    let official: String
}

struct Maps: Codable {
    let googleMaps: String?
    let openStreetMaps: String?
}

struct Flags: Codable {
    let png: String
    let svg: String?
    let alt: String?
}

