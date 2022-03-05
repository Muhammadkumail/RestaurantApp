//
//  RestaurantDetailsViewController.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    let restaurantImageView = ImageView.sharedInstance.getImageView()
    let nameLabel = Label.sharedInstance.getLabel()
    let discriptionLabel = Label.sharedInstance.getLabel()
    let hoursLabel = Label.sharedInstance.getLabel()
    let ratingLabel = Label.sharedInstance.getLabel()
    
    let middleStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.horizontal
        sv.alignment = UIStackView.Alignment.fill
        sv.distribution = UIStackView.Distribution.fill
        sv.translatesAutoresizingMaskIntoConstraints = false;
        return sv
    }()
    
    let bottomStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.horizontal
        sv.alignment = UIStackView.Alignment.fill
        sv.distribution = UIStackView.Distribution.fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false;
        return sv
    }()

    var restauarant: Restuarants?
    var viewModel: RestaurantDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        setupData()
    }
    
    func setupData()  {
        viewModel = RestaurantDetailsViewModel.init(controller: self, data: restauarant)
    }
    
    func setupView() {
        addViews()
        setupLebels()
    }
    
    func setupLebels() {
        
        nameLabel.backgroundColor = .blue
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .center
        
        discriptionLabel.backgroundColor = .gray
        discriptionLabel.textColor = .white
        discriptionLabel.numberOfLines = 0
        discriptionLabel.textAlignment = .center
        
        hoursLabel.backgroundColor = .orange
        hoursLabel.textColor = .white
        hoursLabel.textAlignment = .center
        
        ratingLabel.backgroundColor = .red
        ratingLabel.textColor = .white
        ratingLabel.textAlignment = .center
        
        //middleStackView.backgroundColor = .green
        //bottomStackView.backgroundColor = .lightGray
    }
}

extension RestaurantDetailsViewController {
    
    func addViews(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(restaurantImageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(discriptionLabel)
        self.view.addSubview(hoursLabel)
        self.view.addSubview(ratingLabel)
        self.view.addSubview(middleStackView)
        self.view.addSubview(bottomStackView)
        
        middleStackView.addArrangedSubview(nameLabel)
        middleStackView.addArrangedSubview(discriptionLabel)
        
        bottomStackView.addArrangedSubview(hoursLabel)
        bottomStackView.addArrangedSubview(ratingLabel)
 
    
        restaurantImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 88).isActive = true
        restaurantImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        restaurantImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        restaurantImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        middleStackView.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 0).isActive = true
        middleStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        middleStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        middleStackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        bottomStackView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 0).isActive = true
        bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bottomStackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
}
