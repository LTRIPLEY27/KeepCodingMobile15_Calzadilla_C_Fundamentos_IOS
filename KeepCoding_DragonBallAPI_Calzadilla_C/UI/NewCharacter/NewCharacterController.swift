//
//  NewCharacterController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 27/12/22.
//

import UIKit

class NewCharacterController: UIViewController {

    @IBOutlet weak var nameCharacter: UITextField!
    
    @IBOutlet weak var descriptionCharacter: UITextField!
    
    @IBOutlet weak var photoCharacter: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    private var character : Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func addNewCharacter(_ sender: Any) {
        
        guard let name = nameCharacter.text, !name.isEmpty else {
            print("not email on request")
            return
        }
        
        guard let description = descriptionCharacter.text, !description.isEmpty else {
            print("not description on request")
            return
        }
        
        guard let photo = photoCharacter.text, !photo.isEmpty else {
            print("not photo on request")
            return
        }
    
        makeTheConect(name: name, description: description, photo: photo)
        
    }
    
    func makeTheConect(name : String, description : String, photo : String) -> Void {
        let token = LocalData.shared.getToken()
        //var characters : [Character] = LocalData.shared.charactersOnLocal()
        
        /*if photo == "" {
            var rand = Int.random(in: 0 ... characters.count)
            photo = characters[rand].photo
        }*/
        
        HttpSession.shared.addNew(token: token, name: name, description: description, photo: photo) { [weak self] add, error in
            
            guard let self = self else { return }
            
            if let all = add {
                self.character = all
            }
            else
            {
                print("Add new character, please, restart for see the change: ", error?.localizedDescription.self ?? "")
            }
            
        }
    }
}
