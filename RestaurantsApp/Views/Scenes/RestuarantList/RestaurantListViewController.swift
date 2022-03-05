//
//  RestaurantListViewController.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import UIKit

class RestaurantListViewController: UIViewController{
    
    var collectionview: UICollectionView!
    var cellId = "Cell"
    var viewModel: RestaurantViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewModel()
    }
    
    func setupViewModel() {
        viewModel = RestaurantViewModel.init(controller: self)
    }
    
    func setupViews()  {
        self.title = "List"
        setupNavBar()
        setupCollectionView()
        setupFilterButton()
    }
    
    func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .orange
        appearance.shadowImage = nil
        appearance.backgroundImage = nil
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
    
    func setupFilterButton() {
        let leftCloseItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(self.didTapped_filter))
        self.navigationItem.leftBarButtonItem = leftCloseItem
    }
    
    @objc func didTapped_filter() {
        viewModel?.sortByDistance()
    }

    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 500)
        
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(RestaurantListCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        self.view.addSubview(collectionview)
    }
}

extension RestaurantListViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.restauarants?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? RestaurantListCell
        cell?.delegte = self
        
        cell?.bindData(object: viewModel?.restauarants?[indexPath.row], index: indexPath.row)
        return cell ?? UICollectionViewCell()
    }
    
    func reloadCollectionView() {
        collectionview.reloadData()
    }
}

extension RestaurantListViewController: RestaurantListCellDelegate {
    func showDetails(index: Int) {
        if let data = viewModel?.restauarants?[index] {
            Navigator.sharedInstance.navigateToRestaurantDetailsView(data: data, controller: self)
        }
    }
}
