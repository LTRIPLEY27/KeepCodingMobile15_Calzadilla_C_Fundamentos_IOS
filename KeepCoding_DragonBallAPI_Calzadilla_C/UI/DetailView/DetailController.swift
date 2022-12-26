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
    
    var character : Character!
    var charactersTranforms : [Transformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // EL BOTON NO SE MUESTRA, ÚNICAMENTE SEGÚN EL PERSONAJE Y LA DISPOSICIÓN DE LA TRANSFORMACIÓN
        transformationsCharacter.alpha = 0
        
        title = character.name
        
        imageCharacter.setImage(url: character.photo)
        nameCharacter.text = character.name
        descriptionCharacter.text = character.description
        
        
        makeTheRequest()
        
    }

    func makeTheRequest() {
        let token = LocalData.shared.getToken()
        
        HttpSession.shared.getTransformations(token: token, characterId: character.id) { [weak self] trans, error in
            
            guard let self = self else { return }
            
            if let transforms = trans {
                self.charactersTranforms = transforms
                
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
    
    
    @IBAction func getTransformation(_ sender: Any) {
        
        // llamamos a la transofr view
        
        //let transforView = Tr
    }
    
}
