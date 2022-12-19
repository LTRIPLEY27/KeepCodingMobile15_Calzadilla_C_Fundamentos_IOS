//
//  PrincipalTable.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import UIKit

// IMPLEMENTACIÓN DE INTERFACES
class PrincipalTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableBase: UITableView!
    
    private var characters = [
        Character(name : "Goku", title: "Sayayin", image: UIImage(systemName: "trash.circle")!),
        Character(name : "Gohan", title: "Sayayin Junior", image: UIImage(systemName: "terminal")!),
        Character(name : "Veggeta", title: "Prince Sayayin", image: UIImage(systemName: "book.closed")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DEFINIMOS COMO DELEGADOS A LA MISMA TABLA
        tableBase.delegate = self
        tableBase.dataSource = self
        
        // LLAMAMOS A LA CELDA A USAR
        let xib = UINib(nibName: "CustomCell", bundle: nil)
        
        // REGISTRAMOS
        tableBase.register(xib, forCellReuseIdentifier: "prova")

    }


    // FUNCIONES INHERENTES A LA INTERFACE 'UITableDataSource'
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableBase.dequeueReusableCell(withIdentifier: "prova", for: indexPath) as! CustomCell
        
        let itemCustom = characters[indexPath.row]
        cel.nameCharacter.text = itemCustom.name
        //cel.text = itemCustom.name
        cel.imageCharacter.image = itemCustom.image
        
        return cel
        
    }

}
