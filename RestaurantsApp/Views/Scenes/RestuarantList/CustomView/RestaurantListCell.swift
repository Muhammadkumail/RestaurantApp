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
    let detailsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Check Details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.text = "Bob Lee"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "30000 miles"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let showCaseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "placeHolder")
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    let topSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
//    let stackView: UIStackView = {
//        let sv = UIStackView()
//        sv.axis  = NSLayoutConstraint.Axis.horizontal
//        sv.alignment = UIStackView.Alignment.center
//        sv.distribution = UIStackView.Distribution.fillEqually
//        sv.translatesAutoresizingMaskIntoConstraints = false;
//        return sv
//    }()
//
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
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
        setImage(urlString: object?.image)
    }
    
    func setImage(urlString: String?) {
        
        if let url = URL.init(string: urlString ?? "") {
            
            self.showCaseImageView.sd_setImage(with : url , placeholderImage : UIImage.init(named: "placeHolder") , options : .allowInvalidSSLCertificates) { ( image , error , type , url ) in
                
                guard error == nil else {
                    self.showCaseImageView.image = UIImage.init(named: "placeHolder")
                    return
                }

                guard let img = image else{
                    self.showCaseImageView.image = UIImage.init(named: "placeHolder")
                    return
                }
                
                self.showCaseImageView.image = img
            }
        }
    }
    
    @objc func showDetails(_ sender: UITapGestureRecognizer) {
        delegte?.showDetails(index: index ?? 0)
    }
}
