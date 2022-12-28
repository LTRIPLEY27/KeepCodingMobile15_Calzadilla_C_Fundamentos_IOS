//
//  FavoriteController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 27/12/22.
//

import UIKit

class FavoriteController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var favoritesTable: UITableView!
    private var favorites : [Character] = []
    private var characters : [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTable.delegate = self
        favoritesTable.dataSource = self
        
        navigationItem.title = "Favorites"
        
        let xib = UINib(nibName: "CustomCell", bundle: nil)
        
        favoritesTable.register(xib, forCellReuseIdentifier: "favs")
        
        giveTheFavs()
    }
    
    // IMPREGNACIÓN DE ANIMACIONES A LA COLLECTION VIEW
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        favoritesTable.center.x -= view.bounds.width
        
        // ANIMACIÓN
        UIView.animate(withDuration: 8,
                       delay: 0,
                       usingSpringWithDamping: 0.40,
                       initialSpringVelocity: 0,
                       options: []){
            self.favoritesTable.center.x += self.view.bounds.width
        }
    }
    
    
    // IMPRIME LOS FAVORITOS
    // se debe de cerrar la app para que tome los valores directamente actualizados, no logré reparar el que lo hiciera ipso facto.
    func giveTheFavs() {
        characters = LocalData.shared.charactersOnLocal()
        
        for x in characters where x.favorite == true {
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
