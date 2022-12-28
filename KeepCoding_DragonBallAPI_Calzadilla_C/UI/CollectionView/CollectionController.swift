//
//  CollectionController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 22/12/22.
//

import UIKit

class CollectionController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var characters : [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //title = "Dragon Ball API"
        // LLAMAMOS AL ARCHIVE CONFIG CON LA DATA LOCAL ALMACENADA
        navigationItem.title = "Characters"
        characters = LocalData.shared.charactersOnLocal()
        
        // REGISTRO DEL XIB EN LA VIEW
        let xib = UINib(nibName:"CollectionViewCell" , bundle: nil) // --> NOMBRE DE CLASE CELDA
        collectionView.register(xib, forCellWithReuseIdentifier: "cellCollection")  // --> IDENTIFIER DE XIB
        
    }
    
    // IMPREGNACIÓN DE ANIMACIONES A LA COLLECTION VIEW
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.center.x -= view.bounds.width
        
        // ANIMACIÓN
        UIView.animate(withDuration: 8,
                       delay: 0,
                       usingSpringWithDamping: 0.40,
                       initialSpringVelocity: 0,
                       options: []){
            self.collectionView.center.x += self.view.bounds.width
        }
    }
    
    // MÉTODOS DELEGADOS DE LA INTERFACE 'DATASOURCE'
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollection", for: indexPath) as! CollectionViewCell
        
        let character = characters[indexPath.row]
        cel.imageCharacter.setImage(url: character.photo)
        cel.titleCharacter.text = character.name
        
        return cel
    }
    
    
    // DIMENSIONES DE LA CELDA
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsRow: CGFloat = 2
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = (itemsRow - 1) * spacing
        let finalWidth = (collectionView.frame.width - totalSpacing) / itemsRow
        
        return CGSize(width: finalWidth, height: 160)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let character = characters[indexPath.row]
        let detailsView = DetailController()
        detailsView.character = character
        
        navigationController?.pushViewController(detailsView, animated: true)
    }
}
