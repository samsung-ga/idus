//
//  CraftViewController.swift
//  idus
//
//  Created by 이재용 on 2020/11/14.
//

import UIKit

class CraftViewController: UIViewController {

    var product: [String] = ["시즌 할인 무화과 무화과 왕 큰 컵케이크", "시즌 할인 무화과 무화과 왕 큰 컵케이크","시즌 할인 무화과 무화과 왕 큰 컵케이크", "시즌 할인 무화과 무화과 왕 큰 컵케이크"]
    var imageName: [String] = ["mainImgProduct","mainImgProduct","mainImgProduct","mainImgProduct"]
    var category: [String] = ["디저트","핸드폰케이스","비누","디저트"]
    var seller: [String] = ["홍길동","홍길동","홍길동","홍길동"]
    var discount: [Int] = [58,58,58,58]
    var price : [Int] = [5000,5000,5000,5000]
    
    @IBOutlet weak var idusCollectionView: UICollectionView!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var storyBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var popularBtn: UIButton!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        idusCollectionView.delegate = self
        idusCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func setButton() {
        homeBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB", size: 17)
        storyBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB", size: 17)
        videoBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB", size: 17)
        popularBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB", size: 17)
    }

}

extension CraftViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.size.width/2-16), height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    
}
extension CraftViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath)as? ProductCell else { return UICollectionViewCell()}

        cell.setfImage(imageName: imageName[indexPath.item])
        cell.rankLabel.text = "1"
        cell.cateLabel.text = category[indexPath.item]
        cell.nameLabel.text = product[indexPath.item]
        cell.nameLabel.lineBreakMode = .byTruncatingTail
        cell.sellerLabel.text = seller[indexPath.item]
        cell.discountLabel.text = String(discount[indexPath.item]) + "%"
        cell.priceLabel.text = String(price[indexPath.item]) + "원"
        return cell
    }
    
}

