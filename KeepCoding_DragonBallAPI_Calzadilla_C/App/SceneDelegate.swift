//
//  SceneDelegate.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windows = (scene as? UIWindowScene) else { return }
        
        // INICIALIZAICÓN A LA VISTA DE LA TABLA
        
        window = UIWindow(windowScene: windows)
        
        // DEFINIMOS LA INTERFAZ GRÁFICA A INICICALIZAR COMO RAIZ DE TODA LA APLICACIÓN  
        // ANEXO DE CONDICIONAL PARA ENVIAR UNA INTERFAZ (SE PUDE TRABAJAR MUCHÍSIMO MÁS)
        
        if !LocalData.shared.isUserLogged() {
            window?.rootViewController = LoginViewController() // --> CONDICIONA LA ENTRADA POR TOKEN
        }
        else
        {
            window?.rootViewController = TabController()
            //window?.rootViewController = PrincipalTable()
        }
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

