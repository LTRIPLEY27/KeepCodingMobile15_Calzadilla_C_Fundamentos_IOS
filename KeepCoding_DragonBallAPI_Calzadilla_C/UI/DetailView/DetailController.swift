//
//  DetailController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 23/12/22.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var imageCharacter: UIImageView!
    
    @IBOutlet weak var nameCharacter: UILabel!
    
    @IBOutlet weak var descriptionCharacter: UILabel!
    
    @IBOutlet weak var transformationsCharacter: UIButton!
    
    @IBOutlet weak var favoriteCharacter: UIButton!
    
    
    var character : Character!
    var transformation : Transformation!
    var charactersTranforms : [Transformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // EL BOTON NO SE MUESTRA, ÚNICAMENTE SEGÚN EL PERSONAJE Y LA DISPOSICIÓN DE LA TRANSFORMACIÓN
        transformationsCharacter.alpha = 0
        
        transformDetail()
    }
    
    //**********************
    // IMPREGNACIÓN DE ANIMACIONES A LA TABLEBASE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // DEFINICIÓN DE LOS ELEMENTOS A ANIMAR
        imageCharacter.center.x -= view.bounds.width
        nameCharacter.center.x -= view.bounds.width
        descriptionCharacter.center.x -= view.bounds.width

        // ANIMACIÓN
        UIView.animate(withDuration: 8,
                       delay: 0,
                       usingSpringWithDamping: 0.40,
                       initialSpringVelocity: 0,
                       options: []){
            self.imageCharacter.center.x += self.view.bounds.width
            self.nameCharacter.center.x += self.view.bounds.width
            self.descriptionCharacter.center.x += self.view.bounds.width
            
        }

    }
    
    //*******

    
    // FUNCIÓN QUE REUTILIZA LOS DETAILS PARA TRANSFORMATION Y PARA DETAIL DE PERSONAJES
    func transformDetail() {
        if(character != nil) {
            title = character.name
            imageCharacter.setImage(url: character.photo)
            nameCharacter.text = character.name
            descriptionCharacter.text = character.description
            favoriteCharacter.alpha = 0
            makeTheRequest()
        }
        else {
            title = transformation.name
            imageCharacter.setImage(url: transformation.photo)
            nameCharacter.text = transformation.name
            descriptionCharacter.text = transformation.description
            
        }
    }

    func makeTheRequest() {
        let token = LocalData.shared.getToken()
        
        HttpSession.shared.getTransformations(token: token, characterId: character.id) { [weak self] trans, error in
            
            guard let self = self else { return }
            
            if let transforms = trans {
                self.charactersTranforms = transforms
                
                print("transform")
                print("Tranformations count", transforms.count)
                
                if !self.charactersTranforms.isEmpty {
                    DispatchQueue.main.async {
                        self.transformationsCharacter.alpha = 1
                    }
                }
            } else {
                print("Error on transformation ", error?.localizedDescription ?? "")
            }
        }
    }
    
    // ACTION DEL BUTTON 'TRANFORMACIONES' PARA ENVIAR AL DETAIL DEL MISMO
    @IBAction func getTransformation(_ sender: Any) {
        
        //llamamos a la transform view
        
        let transforView = TransformatioController()
        transforView.transformations = self.charactersTranforms
        
        navigationController?.pushViewController(transforView, animated: true)
    }
    
    // ACTION DEL BUTTON 'Like' PARA AGREGAR AL PERSONAJE COMO ME GUSTA
    @IBAction func pushFavorite(_ sender: Any) {
        let token = LocalData.shared.getToken()
        
        HttpSession.shared.getTheFavs(token: token, idHeroe: transformation.hero["id"]) { [weak self] trans, error in
            
            guard let self = self else { return }
            
            if let all = trans {
                self.character = all.first
            }
            else
            {
                print("Add to Favorites : ", error?.localizedDescription.self ?? "")
            }
        }
    }
        
}
