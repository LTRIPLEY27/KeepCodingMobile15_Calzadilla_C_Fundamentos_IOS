//
//  LoginViewController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    // ELEMENTOS DE LA VIEW QUE PODRÁN INTERACTURAR
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var enter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    // ACTION DEL BUTTON PARA LLAMAR A LA FUNCIÓN
    @IBAction func pressButton(_ sender: UIButton) {
        
        // VERIFICACIÓN MEDIANTE GUARDS DE CADA UNO DE LOS CAMPOS, INTERRUMPE LA ECUCIÓN SI ESTÁN VACÍOS
        guard let email = email.text, !email.isEmpty else {
            print("not email on request")
            return
        }
        
        guard let password = password.text, !password.isEmpty else {
            print("password is empty")
            return
        }
        
        // LLAMADA AL MÉTODO DEL MANAGER PARA HACER LA REQUESTS
        HttpSession.shared.login(email: email, password: password) { token, error in
            
            // CONDICIÓN PARA VALIDAR EL TOKEN Y RETORNO EN CADA CASO
            if let token = token {
                LocalData.shared.save(token: token)
                print("Hello Saiyan Warrior")
                print(token)
            }
            else
            {
                print("Login error : ", error?.localizedDescription ?? "")
            }
            
        }
    }
    

}
