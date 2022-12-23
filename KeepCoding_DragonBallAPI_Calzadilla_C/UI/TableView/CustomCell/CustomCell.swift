//
//  CustomCell.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import UIKit

class CustomCell: UITableViewCell {

    /* IBOutlet para cada detalle de la celda */

    @IBOutlet weak var imageCharacter: UIImageView!
    
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var descriptionCharacter: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

/**    /* IBOutlet para cada detalle de la celda */
 @IBOutlet weak var detailButton: UIButton!
 @IBOutlet weak var nameCharacter: UILabel!
 @IBOutlet weak var imageCharacter: UIImageView!
 @IBOutlet weak var descriptionCharacter: UILabel!*/
