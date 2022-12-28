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
    
    var characters : [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DEFINIMOS COMO DELEGADOS A LA MISMA TABLA
        tableBase.delegate = self
        tableBase.dataSource = self
        
        navigationItem.title = "Dragon Ball API"
        // LLAMAMOS A LA CELDA A USAR
        let xib = UINib(nibName: "CustomCell", bundle: nil)
        
        // REGISTRAMOS
        tableBase.register(xib, forCellReuseIdentifier: "prova")
        
        // LLAMADO A LA FUNCIÓN PARA REALIZAR LA REQUEST A LA API
        makeTheConsult()
    }
    
    // IMPREGNACIÓN DE ANIMACIONES A LA TABLEBASE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableBase.center.x -= view.bounds.width
        
        // ANIMACIÓN
        UIView.animate(withDuration: 8,
                       delay: 0,
                       usingSpringWithDamping: 0.40,
                       initialSpringVelocity: 0,
                       options: []){
            self.tableBase.center.x += self.view.bounds.width
        }

    }
    
    //*******
    // FUNCION QUE CONECTA LA REQUESR MEDIANTE EL LLAMADO DEL MANAGER
    func makeTheConsult() {
        // VERIFICACIÓN DEL TOKEN
        let token = LocalData.shared.getToken()
        
        // BLOQUE DE INICIO REQUEST
        // REALIZAMOS LA REUEST CON ENVÍO DEL TOKEN
        HttpSession.shared.allRegisters(token: token) { [weak self] all, error in
            // LA VARIABLE REFIERE AL TABLEVIEW CONTROLLER --> 'Self'
            guard let self = self else { return }
            
            if let all = all {
                self.characters = all
                
                // INVOCAMOS AL MÉTODO LOCAL DATA LAYER PARA IMPRIMIR EL ARRAY DEL REQUEST
                LocalData().save(characters: all)
                
                // ENVÍO LA IMPRESIÓN DEL REQUEST EN EL HILO PRINCIPAL
                DispatchQueue.main.async {
                    self.tableBase.reloadData()
                }
            }
            else
            {
                print("Error fetching heroes : ", error?.localizedDescription.self ?? "")
                print(self.characters[0].name)
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
        cel.imageCharacter.setImage(url: itemCustom.photo)
        cel.descriptionCharacter.text = itemCustom.description
        
        cel.accessoryType = .disclosureIndicator
        cel.selectionStyle = .none
        
        return cel
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    // FUNCIÓN QUE TOMA EL ITEM EXACTO PULSADO Y ENVÍA AL DETAIL DE ESE PERSONAJE
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        let detailsView = DetailController()
        detailsView.character = character
        navigationController?.pushViewController(detailsView, animated: true)
    }
}




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
