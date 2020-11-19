//
//  ProductCell.swift
//  idus
//
//  Created by JUEUN KIM on 2020/11/15.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static let identifier = "ProductCell"
    
    @IBOutlet weak var proImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var cateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setImage(imageName: String){
        proImageView.image = UIImage(named: imageName)
    }
    
}
