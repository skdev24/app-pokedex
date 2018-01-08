//
//  ViewController.swift
//  Pokedex
//
//  Created by Shivam Dev on 08/01/18.
//  Copyright © 2018 Shivam Dev. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pokedex = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        pokedex.append(Pokemon(name: "Pidgey", type: "Normal/Flying", summary: "Pidgey is pure XP gold.", evolutions: ["Pidgeotto", "Pidgeot"]))
        pokedex.append(Pokemon(name: "Spearow", type: "Normal/Flying", summary: "Searow is remarkably angry.", evolutions: ["Fearow"]))
        pokedex.append(Pokemon(name: "Jynx", type: "Psychic", summary: "will cast apell on you.", evolutions: []))

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let pokemon = pokedex[indexPath.row]
        
        cell.textLabel?.text = pokemon.name
        cell.detailTextLabel?.text = pokemon.type
        cell.imageView?.image = UIImage(named: "\(pokemon.name)-Thumb")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.pokemon = pokedex[indexPath.row]
            
        }
        
    }
    


}

