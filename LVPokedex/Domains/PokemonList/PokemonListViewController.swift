
import UIKit

class PokemonListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var viewModel = PokemonListViewModel()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Pokemons List"
        
        viewModel.fetchPokemons {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension PokemonListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.pokemonsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as! PokemonCell
        cell.label.text = viewModel.pokemonsList?[indexPath.row].name?.capitalized ?? ""
        return cell
    }
}

extension PokemonListViewController: UITableViewDelegate {
    
}

