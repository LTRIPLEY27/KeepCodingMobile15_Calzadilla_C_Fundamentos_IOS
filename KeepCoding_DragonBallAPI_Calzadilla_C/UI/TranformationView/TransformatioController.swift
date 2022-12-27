//
//  TransformatioController.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 26/12/22.
//

import UIKit

class TransformatioController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transformationView: UITableView!
    
    var transformations : [Transformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sorting()
        transformationView.dataSource = self
        transformationView.delegate = self
        
        let xib = UINib(nibName: "CustomCell", bundle: nil)
        
        transformationView.register(xib, forCellReuseIdentifier: "transformation")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = transformationView.dequeueReusableCell(withIdentifier: "transformation", for: indexPath) as! CustomCell
        
        let characterTransfor = transformations[indexPath.row]
        
        cell.imageCharacter.setImage(url: characterTransfor.photo)
        cell.nameCharacter.text = characterTransfor.name
        cell.descriptionCharacter.text = characterTransfor.description
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
    
    // APUNTA A LA TRANSFORMACIÓN SELECCIONADA
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let transformation = transformations[indexPath.row]
        
        // DEFINIMOS EL DETAIL
        let detail = DetailController()
        
        detail.transformation = transformation
        
        navigationController?.pushViewController(detail, animated: true)
    }
    
    // FUNCIÓN PARA ORDENAR EL RESULTADO COMPARANDO LOS NAMES QUE CONTIENEN NÚMERO
    
    func sorting(){
        transformations.sort{
            $0.name < $1.name
        }
    }
}
