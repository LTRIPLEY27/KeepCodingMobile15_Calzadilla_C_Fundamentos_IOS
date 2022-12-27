//
//  TabController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 22/12/22.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        putOnView()
        setLayout()
        
        //
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(allRegisters),
                                               name: Notification.Name("allRegisters"),
                                               object: nil)
        
    }

    @objc func allRegisters() {
        print("Sending Saiyans from Tab")
    }

    // EN LA FUNCIÓN SE DEFINEN LAS POSICIONES DE LOS TAGS A MOSTRAR
    private func putOnView() {
        
        // DEFINICIÓN DEL NAVIGATION CONTROLLER QUE INVOQUE A LA TABLEVIEW
        let navControllerA = UINavigationController(rootViewController: PrincipalTable())
        let tabImageA = UIImage(systemName: "text.justify")!
        
        // DEFINICIÓN DEL NAV Y EL ITEM EN LA VIEW  -->
        navControllerA.tabBarItem = UITabBarItem(title: "TableView", image: tabImageA, tag: 0)
        
        // DEFINICIÓN DEL NAVIGATION CONTROLLER QUE INVOQUE A LA COLLECTIONVIEW
        let navControllerB = UINavigationController(rootViewController: CollectionController())
        let tabImageB = UIImage(systemName: "square.grid.3x3.topleft.fill")!
        
        // DEFINICIÓN DEL NAV Y EL ITEM EN LA VIEW  -->
        navControllerB.tabBarItem = UITabBarItem(title: "CollectionView", image: tabImageB, tag: 1)
        
        let navControllerC = UINavigationController(rootViewController: FavoriteController())
        let tabImageC = UIImage(systemName: "heart.text.square")!
        
        navControllerC.tabBarItem = UITabBarItem(title: "Favs", image: tabImageC, tag: 3)
        

        
        // ARRAY DE ITEMS A CONTENER EN EL TAB, LE INDICAMREMOS, CUANTOS DESEEMOS
        viewControllers = [navControllerA, navControllerB, navControllerC]
    }
    
    private func setLayout(){
        
        tabBar.backgroundColor = .systemBackground
    }
}
