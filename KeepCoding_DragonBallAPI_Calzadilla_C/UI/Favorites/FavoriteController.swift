//
//  FavoriteController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 27/12/22.
//

import UIKit

class FavoriteController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var favoritesTable: UITableView!
    private var favorites :[Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTable.delegate = self
        favoritesTable.dataSource = self
        
        navigationItem.title = "Favorites"
        
        let xib = UINib(nibName: "CustomCell", bundle: nil)
        
        favoritesTable.register(xib, forCellReuseIdentifier: "favs")
        
        giveTheFavs()
    }
    
    // IMPRIME LOS FAVORITOS
    func giveTheFavs() {
        let character : [Character] = LocalData.shared.charactersOnLocal()
        for x in character where x.favorite == true {
            favorites.append(x)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = favoritesTable.dequeueReusableCell(withIdentifier: "favs", for: indexPath) as! CustomCell
        
        let favoriteCharacter = favorites[indexPath.row]
        
        cell.imageCharacter.setImage(url: favoriteCharacter.photo)
        cell.nameCharacter.text = favoriteCharacter.name
        cell.descriptionCharacter.text = favoriteCharacter.description
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favs = favorites[indexPath.row]
        
        let detail = DetailController()
        
        detail.character = favs
        
        navigationController?.pushViewController(detail, animated: true)
    }
}