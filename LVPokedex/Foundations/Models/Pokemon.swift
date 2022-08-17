
import Foundation

class Pokemon: Decodable {
    
    let id: Int?
    let name: String?
    let url: String?
}

struct PokemonListResponse: Decodable {
    
    var results: [Pokemon]
}
