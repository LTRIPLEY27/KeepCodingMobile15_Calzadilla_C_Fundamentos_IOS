//
//  LoginViewController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    // ELEMENTOS DE LA VIEW QUE PODRÁN INTERACTURAR
    
    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    /*
    // IMPREGNACIÓN DE ANIMACIONES
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        email.center.x -= view.bounds.width
        password.center.x -= view.bounds.width
        
        enter.alpha = 0
        
        
        // ANIMACIÓN
        UIView.animate(withDuration: 5,
                       delay: 0,
                       usingSpringWithDamping: 0,75,
                       initialSpringVelocity: 0
                       options: []) {
            self.email.center.x += self.view.bounds.width
            self.password.center.x += self.view.bounds.width
        }
        
        UIView.animate()
    }*/
    

    // ACTION DEL BUTTON PARA LLAMAR A LA FUNCIÓN
    @IBAction func BtnLogin(_ sender: Any) {
        // VERIFICACIÓN MEDIANTE GUARDS DE CADA UNO DE LOS CAMPOS, INTERRUMPE LA ECUCIÓN SI ESTÁN VACÍOS
        guard let email = emailLogin.text, !email.isEmpty else {
            print("not email on request")
            return
        }
        
        guard let password = passwordLogin.text, !password.isEmpty else {
            print("password is empty")
            return
        }
        
        // FUNCIÓN PARA LLAMAR AL MÉTODO DEL MANAGER Y REALIZAR LA CONEXIÓN Y VERIFICACIÓN DEL TOKEN
        makeTheConect(email: email, password: password)
        
    }
    
    
    private func makeTheConect(email : String, password : String) -> Void {
        // LLAMADA AL MÉTODO DEL MANAGER PARA HACER LA REQUESTS
        HttpSession.shared.login(email: email, password: password) { token, error in
            
            // CONDICIÓN PARA VALIDAR EL TOKEN Y RETORNO EN CADA CASO
            if let token = token {
                LocalData.shared.save(token: token)
                print("Hello Saiyan Warrior")
                print(token)
                
                // ENVÍO AL HILO PRINCINAPL DE UNA VISTA A ENLAZAR, DECLARANDO EL ROOTVIEWCONTROLER CON LA VIEW QUE DESEAMOS
                DispatchQueue.main.async {
                    
                    UIApplication
                        .shared
                        .connectedScenes
                        .compactMap{($0 as? UIWindowScene)?.keyWindow }   // LLAMADO A REINICAR DESDE EL MAIN LA INTERFICIE DECLARADA
                        .first?
                        .rootViewController = PrincipalTable()  // PANTALLA A ENLAZAR
                }
            }
            else
            {
                print("Login error : ", error?.localizedDescription ?? "")
            }
        }
    }

}
