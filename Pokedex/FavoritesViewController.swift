//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Shivam Dev on 08/01/18.
//  Copyright © 2018 Shivam Dev. All rights reserved.
//

import UIKit

class FavoritesViewController: UICollectionViewController {
    
    var favourites = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "My Favorite Pokemon"
        
        let defaults = UserDefaults.standard
        let savefavourites = defaults.object(forKey: "Favorites") as? [String] ?? [String]()
        
        if savefavourites != favourites {
            favourites = savefavourites
            collectionView?.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favourites.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let pokemon = favourites[indexPath.item]
        
        if let imageView = cell.viewWithTag(1024) as? UIImageView {
            imageView.image = UIImage(named: pokemon)
        }
        
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
