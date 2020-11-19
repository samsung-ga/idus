//
//  CraftViewController.swift
//  idus
//
//  Created by 이재용 on 2020/11/14.
//

import UIKit

class CraftViewController: UIViewController {

    var product: [String] = ["시즌 할인 무화과 무화과 왕 큰 컵케이크", "시즌 할인 무화과 무화과 왕 큰 컵케이크","시즌 할인 무화과 무화과 왕 큰 컵케이크", "시즌 할인 무화과 무화과 왕 큰 컵케이크","시즌 할인 무화과 무화과 왕 큰 컵케이크","시즌 할인 무화과 무화과 왕 큰 컵케이크"]
    var imageName: [String] = ["mainImgProduct1","mainImgProduct2","mainImgProduct3","mainImgProduct4","mainImgProduct5","mainImgProduct6"]
    var category: [String] = ["디저트","핸드폰케이스","비누","디저트","비누","디저트"]
    var seller: [String] = ["홍길동","홍길동","홍길동","홍길동","홍길동","홍길동"]
    var discount: [Int] = [58,58,58,58,58,58]
    var price : [Int] = [5000,5000,5000,5000,5000,5000]
    var rank : [Int] = [1,2,3,4,5,6]
 
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
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
    
    
    //Center Btn Set
    @IBOutlet weak var popCraftBtn: UIButton!
    @IBOutlet weak var lastestBtn: UIButton!
    @IBOutlet weak var popReviewBtn: UIButton!
    @IBOutlet weak var recomMakerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idusCollectionView.delegate = self
        idusCollectionView.dataSource = self

    }
    override func viewDidAppear(_ animated: Bool) {
        setHeight()
        setBtns()
        setProportion()
    }
    
    func setHeight() {
        //collectionViewHeight?.constant = CGFloat(Float(300 * (product.count/2)))
        collectionViewHeight?.constant = idusCollectionView.contentSize.height
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
    
    func setProportion() {
        //homeBtn.frame = CGRect(x: 20, y:90, width: (61/355) * upperBtnSet.frame.width, height: upperBtnSet.frame.height)
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
        CGSize(width: (collectionView.frame.size.width/2-16), height: 300)
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
                cell.rankLabel.text = String(rank[indexPath.item])
                cell.cateLabel.text = category[indexPath.item]
                cell.cateLabel.layer.cornerRadius = 5
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
        return cell}
}
