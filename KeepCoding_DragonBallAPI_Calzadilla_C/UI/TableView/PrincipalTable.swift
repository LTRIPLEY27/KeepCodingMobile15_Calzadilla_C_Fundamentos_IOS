//
//  PrincipalTable.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import UIKit

struct CustomItem {
    let image: UIImage
    let text: String
}

// IMPLEMENTACIÓN DE INTERFACES
class PrincipalTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableBase: UITableView!
    
    /*private var characters = [
     Character(name : "Goku", title: "Sayayin", image: UIImage(systemName: "trash.circle")!),
     Character(name : "Gohan", title: "Sayayin Junior", image: UIImage(systemName: "terminal")!),
     Character(name : "Veggeta", title: "Prince Sayayin", image: UIImage(systemName: "book.closed")!),
     ]*/
    
    var characters : [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DEFINIMOS COMO DELEGADOS A LA MISMA TABLA
        tableBase.delegate = self
        tableBase.dataSource = self
        
        // LLAMAMOS A LA CELDA A USAR
        let xib = UINib(nibName: "CustomCell", bundle: nil)
        
        // REGISTRAMOS
        tableBase.register(xib, forCellReuseIdentifier: "prova")
        
        
        // VERIFICACIÓN DEL TOKEN
        let token = LocalData.shared.getToken()
        
        // BLOQUE DE INICIO REQUEST
        // REALIZAMOS LA REUEST CON ENVÍO DEL TOKEN
        HttpSession.shared.allRegisters(token: token) { [weak self] allRegisters, error in
            
            guard let self = self else { return }
            
            if let allRegisters = allRegisters {
                self.characters = allRegisters
                
                DispatchQueue.main.async {
                    self.tableBase.reloadData()
                }
            }
            else
            {
                print("Error fetching heroes : ", error?.localizedDescription ?? "")
            }
            
        }
        
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
        //cel.imageCharacter.setImage(url: itemCustom.photo)
        cel.imageCharacter.setImage(url: itemCustom.photo)
        
        cel.accessoryType = .disclosureIndicator
        cel.selectionStyle = .none
        
        return cel
        
    }
}
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        
    }*/
    
    extension UIImageView {
        func setImage(url: String) {
            guard let url = URL(string: url) else { return }
            
            downloadImage(url: url) { [weak self] image in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        
        private func downloadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
            URLSession.shared.dataTask(with: url) {data, response, error in
                
                guard let data = data, let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                
                completion(image)
            }.resume()
        }
    }
//}
