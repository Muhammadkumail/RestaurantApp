//
//  RestaurantListCell.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import UIKit
import SDWebImage

protocol RestaurantListCellDelegate {
    func showDetails(index: Int)
}

class RestaurantListCell: UICollectionViewCell {
    
    var delegte: RestaurantListCellDelegate?
    var index: Int?
    
    let detailsButton = Button.sharedInstance.getButton()
    let nameLabel = Label.sharedInstance.getLabel()
    let distanceLabel = Label.sharedInstance.getLabel()
    let showCaseImageView = ImageView.sharedInstance.getImageView()
    let topSeparatorView = View.sharedInstance.getView()
    let bottomSeparatorView = View.sharedInstance.getView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setLabelColors()
        setupButtonView()
    }
    
    func setLabelColors() {
        nameLabel.textColor = .black
        distanceLabel.textColor = .blue
    }
    
    func setupButtonView()  {
        detailsButton.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
    }
    
    func addViews(){
        backgroundColor = UIColor.white
        addSubview(detailsButton)
        addSubview(nameLabel)
        addSubview(distanceLabel)
        addSubview(showCaseImageView)
        
        addSubview(topSeparatorView)
        addSubview(bottomSeparatorView)
        
        detailsButton.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        detailsButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        detailsButton.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        detailsButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: detailsButton.rightAnchor,constant: 10).isActive = true
        
        distanceLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        
        showCaseImageView.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 10).isActive = true
        showCaseImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        showCaseImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        
        topSeparatorView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        bottomSeparatorView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindData(object: Restuarants?, index: Int?) {
        self.index = index
        self.distanceLabel.text = "\(object?.distance ?? 0.0)"
        self.nameLabel.text = object?.name
        ImageView.sharedInstance.setImage(urlString: object?.image, imageView: self.showCaseImageView)
    }
    
    @objc func showDetails(_ sender: UITapGestureRecognizer) {
        delegte?.showDetails(index: index ?? 0)
    }
}
