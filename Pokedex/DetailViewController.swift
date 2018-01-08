//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Shivam Dev on 08/01/18.
//  Copyright © 2018 Shivam Dev. All rights reserved.
//

import SafariServices
import UIKit

class DetailViewController: UITableViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var summary: UILabel!
    @IBOutlet var evolution: UILabel!
    @IBOutlet var toggleFavorites: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        hidesBottomBarWhenPushed = true
    }
    
    var pokemon: Pokemon! //Implicitly unwrap optional

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = pokemon.name
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        let readMore = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(readMoreTapped))
        
        navigationItem.rightBarButtonItems = [share, readMore]
        
        imageView.image = UIImage(named: pokemon.name)
        name.text = pokemon.name.uppercased()
        type.text = pokemon.type
        summary.text = pokemon.summary
        if pokemon.evolutions.count > 0 {
        evolution.text = "\(pokemon.name) > " + pokemon.evolutions.joined(separator: " > ")  //Joint method which cantatenates an array using a glue string
        } else {
            evolution.text = pokemon.name
        }
        
        setFavouriteLable()
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return UITableViewAutomaticDimension
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
        
    }
    
    @objc func shareTapped() {
        let items: [Any] = [pokemon.summary,imageView.image!]
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }
    
    @objc func readMoreTapped() {
        if let url = URL(string: "http://pokemondb.net/pokedex/\(pokemon.name)") {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true, completion: nil)
        }
    }
    
    func setFavouriteLable() {
        let defaults = UserDefaults.standard
        let favorites = defaults.object(forKey: "Favorites") as? [String] ?? [String]()
        
        if favorites.contains(pokemon.name) {
            toggleFavorites.text = "Remove from favorites"
        } else {
            toggleFavorites.text = "Add to favorite"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard indexPath.row == 5 else { return }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let defaults = UserDefaults.standard
        var favorites = defaults.object(forKey: "Favorites") as? [String] ?? [String]()
        
        if let index = favorites.index(of: pokemon.name) {
            favorites.remove(at: index)
        } else {
            favorites.append(pokemon.name)
        }
        
        defaults.set(favorites, forKey: "Favorites")
        setFavouriteLable()
        
    }

}
