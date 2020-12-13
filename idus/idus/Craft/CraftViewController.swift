//
//  CraftViewController.swift
//  idus
//
//  Created by 이재용 on 2020/11/14.
//

import UIKit
import Kingfisher

class CraftViewController: UIViewController {
    
    var product: [String] = []
    var imageName: [String] = []
    var category: [String] = []
    var seller: [String] = []
    var discount: [Int] = []
    var price : [Int] = []
    var rank : [Int] = []
    var productData = ""
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var idusCollectionView: UICollectionView!
    
    @IBOutlet weak var upperBtnSet: UIStackView!
    
    //upper Btn Set
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var StoryBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var popMakerBtn: UIButton!
    
    //views with upper Btn Set
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var storyView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var popMakerView: UIView!
    
    @IBOutlet var bannerImageView: UIImageView!
    
    //Center Btn Set
    @IBOutlet weak var popCraftBtn: UIButton!
    @IBOutlet weak var lastestBtn: UIButton!
    @IBOutlet weak var popReviewBtn: UIButton!
    @IBOutlet weak var recomMakerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idusCollectionView.delegate = self
        idusCollectionView.dataSource = self
        ProductService.shared.Product(craft: self)
        BannerService.shared.Banner(craft: self)
    }
    override func viewDidAppear(_ animated: Bool) {
        setHeight()
        setBtns()
        
    }
    func setProduct() {
        print("ㅡ")
        print(ProductService.productDataData)
        print("ㅡ")
    }
    func setBanner(){
        let url = URL(string: BannerService.bannerUri)
        //        guard let bannerUri = try? Data(contentsOf: url!) else {
        //            print("error_banner")
        //            return
        //        }
        //bannerImageView.image = UIImage(data: bannerUri)
        bannerImageView.kf.setImage(with: url)
        //kingfisher를 사용하면 이미지를 캐싱하여 재접근 할 시에 이미지 로딩 시간을 다량으로 줄여준다.
    }
    func setHeight() {
        //collectionViewHeight?.constant = CGFloat(Float(300 * (product.count/2)))
        //collectionViewHeight?.constant = idusCollectionView.contentSize.height
    }
    
    func setBtns() {
        //upper Btn set
        homeBtn.setTitleColor(UIColor(named: "reddish"), for: .normal)
        StoryBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        videoBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        popMakerBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        
        homeBtn.setTitle("홈", for: .normal)
        homeBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        homeBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 17)
        StoryBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        videoBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        popMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        
        homeView.backgroundColor = UIColor(named: "reddish")
        storyView.backgroundColor = UIColor(named: "White")
        videoView.backgroundColor = UIColor(named: "White")
        popMakerView.backgroundColor = UIColor(named: "White")
        
        //center Btn set
        popCraftBtn.layer.cornerRadius = 15
        lastestBtn.layer.cornerRadius = 15
        popReviewBtn.layer.cornerRadius = 15
        recomMakerBtn.layer.cornerRadius = 15
        
        popCraftBtn.backgroundColor = UIColor(named: "melon")
        lastestBtn.backgroundColor = UIColor(named: "white")
        popReviewBtn.backgroundColor = UIColor(named: "white")
        recomMakerBtn.backgroundColor = UIColor(named: "white")
        
        popCraftBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 14)
        lastestBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        popReviewBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        recomMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        
        popCraftBtn.setTitleColor(UIColor(named: "white"), for: .normal)
        lastestBtn.setTitleColor(UIColor.black, for: .normal)
        popReviewBtn.setTitleColor(UIColor.black, for: .normal)
        recomMakerBtn.setTitleColor(UIColor.black, for: .normal)
        
    }
    
    @IBAction func homeBtnTouch(_ sender: Any) {
        homeView.backgroundColor = UIColor(named: "reddish")
        storyView.backgroundColor = UIColor(named: "White")
        videoView.backgroundColor = UIColor(named: "White")
        popMakerView.backgroundColor = UIColor(named: "White")
        
        homeBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        StoryBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 17)
        videoBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        popMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        
        homeBtn.setTitleColor(UIColor(named: "reddish"), for: .normal)
        StoryBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        videoBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        popMakerBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        
    }
    @IBAction func storyBtnTouch(_ sender: Any) {
        homeView.backgroundColor = UIColor(named: "White")
        storyView.backgroundColor = UIColor(named: "reddish")
        videoView.backgroundColor = UIColor(named: "White")
        popMakerView.backgroundColor = UIColor(named: "White")
        
        homeBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        StoryBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 17)
        videoBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        popMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        
        homeBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        StoryBtn.setTitleColor(UIColor(named: "reddish"), for: .normal)
        videoBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        popMakerBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        
    }
    @IBAction func videoBtnView(_ sender: Any) {
        
        homeView.backgroundColor = UIColor(named: "White")
        storyView.backgroundColor = UIColor(named: "White")
        videoView.backgroundColor = UIColor(named: "reddish")
        popMakerView.backgroundColor = UIColor(named: "White")
        
        homeBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        StoryBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        videoBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 17)
        popMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        
        homeBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        StoryBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        videoBtn.setTitleColor(UIColor(named: "reddish"), for: .normal)
        popMakerBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
    }
    @IBAction func popMakerBtnView(_ sender: Any) {
        homeView.backgroundColor = UIColor(named: "White")
        storyView.backgroundColor = UIColor(named: "White")
        videoView.backgroundColor = UIColor(named: "White")
        popMakerView.backgroundColor = UIColor(named: "reddish")
        
        homeBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        StoryBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        videoBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoM00", size: 17)
        popMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 17)
        
        homeBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        StoryBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        videoBtn.setTitleColor(UIColor(named: "cloudyBlue"), for: .normal)
        popMakerBtn.setTitleColor(UIColor(named: "reddish"), for: .normal)
    }
    
    //
    
    @IBAction func popCraftBtnTouch(_ sender: Any) {
        popCraftBtn.backgroundColor = UIColor(named: "melon")
        lastestBtn.backgroundColor = UIColor(named: "white")
        popReviewBtn.backgroundColor = UIColor(named: "white")
        recomMakerBtn.backgroundColor = UIColor(named: "white")
        
        popCraftBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 14)
        lastestBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        popReviewBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        recomMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        
        
        popCraftBtn.setTitleColor(UIColor(named: "white"), for: .normal)
        lastestBtn.setTitleColor(UIColor.black, for: .normal)
        popReviewBtn.setTitleColor(UIColor.black, for: .normal)
        recomMakerBtn.setTitleColor(UIColor.black, for: .normal)
        
    }
    @IBAction func lastestBtnTouch(_ sender: Any) {
        popCraftBtn.backgroundColor = UIColor(named: "white")
        lastestBtn.backgroundColor = UIColor(named: "melon")
        popReviewBtn.backgroundColor = UIColor(named: "white")
        recomMakerBtn.backgroundColor = UIColor(named: "white")
        
        popCraftBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        lastestBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 14)
        popReviewBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        recomMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        
        popCraftBtn.setTitleColor(UIColor.black, for: .normal)
        lastestBtn.setTitleColor(UIColor(named: "white"), for: .normal)
        popReviewBtn.setTitleColor(UIColor.black, for: .normal)
        recomMakerBtn.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func popReviewBtnTouch(_ sender: Any) {
        popCraftBtn.backgroundColor = UIColor(named: "white")
        lastestBtn.backgroundColor = UIColor(named: "white")
        popReviewBtn.backgroundColor = UIColor(named: "melon")
        recomMakerBtn.backgroundColor = UIColor(named: "white")
        
        popCraftBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        lastestBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        popReviewBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 14)
        recomMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        
        popCraftBtn.setTitleColor(UIColor.black, for: .normal)
        lastestBtn.setTitleColor(UIColor.black, for: .normal)
        popReviewBtn.setTitleColor(UIColor(named: "white"), for: .normal)
        recomMakerBtn.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func recomMakerBtnTouch(_ sender: Any) {
        popCraftBtn.backgroundColor = UIColor(named: "white")
        lastestBtn.backgroundColor = UIColor(named: "white")
        popReviewBtn.backgroundColor = UIColor(named: "white")
        recomMakerBtn.backgroundColor = UIColor(named: "melon")
        
        popCraftBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        lastestBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        popReviewBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoR00", size: 14)
        recomMakerBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeoB00", size: 14)
        
        popCraftBtn.setTitleColor(UIColor.black, for: .normal)
        lastestBtn.setTitleColor(UIColor.black, for: .normal)
        popReviewBtn.setTitleColor(UIColor.black, for: .normal)
        recomMakerBtn.setTitleColor(UIColor(named: "white"), for: .normal)
    }
}

extension CraftViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.size.width/2-16), height: 320)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}
extension CraftViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = idusCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            return UICollectionViewCell() }
        
        cell.setImage(imageName: imageName[indexPath.item])
        cell.setNumberofLines()
        cell.rankLabel.text = String(rank[indexPath.item])
        cell.cateLabel.text = category[indexPath.item]
        cell.cateLabel.layer.cornerRadius = 5
        cell.nameLabel.lineBreakMode = .byWordWrapping
        cell.nameLabel.numberOfLines = 2
        
        if cell.cateLabel.text == category[0]{
            cell.cateLabel.backgroundColor = UIColor(named: "lightLavender")
        } else if cell.cateLabel.text == category[1]{
            cell.cateLabel.backgroundColor = UIColor(named: "lightKhaki")
        } else if cell.cateLabel.text == category[2]{
            cell.cateLabel.backgroundColor = UIColor(named: "lightPeriwinkle")
        }
        
        cell.nameLabel.text = product[indexPath.item]
        cell.nameLabel.lineBreakMode = .byTruncatingTail
        cell.sellerLabel.text = seller[indexPath.item]
        cell.discountLabel.text = String(discount[indexPath.item]) + "%"
        cell.priceLabel.text = String(price[indexPath.item]) + "원"
        return cell
        
    }
}
