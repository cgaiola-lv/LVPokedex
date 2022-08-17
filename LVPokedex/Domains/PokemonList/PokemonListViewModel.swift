
import UIKit
import Foundation

class PokemonListViewModel {
        
    var pokemonsList: [Pokemon]?
    
    enum Constants {
        static let apiURL = "https://pokeapi.co/api/v2/pokemon"
        static let defaultNbOfPokemons = 150
    }
    
    func fetchPokemons(nb: Int? = nil, completionHandler: @escaping () -> Void) {
        let nbPokemon = nb ?? Constants.defaultNbOfPokemons
        
        let url = URL(string: "\(Constants.apiURL)?limit=\(nbPokemon)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(PokemonListResponse.self, from: data) {
                    self.pokemonsList = response.results
                }
            }
            completionHandler()
        }
        
        task.resume()
    }
}
