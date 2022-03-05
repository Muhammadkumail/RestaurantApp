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
    }
    
    func setupNavBar() {
        NavigationBar.sharedInstance.setupNavigationController(nav: self.navigationController)
        setupFilterButton()
    }
    
    func setupFilterButton() {
        let leftCloseItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(self.didTapped_filter))
        self.navigationItem.leftBarButtonItem = leftCloseItem
    }
    
    @objc func didTapped_filter() {
        viewModel?.sortByDistance()
    }

    func setupCollectionView() {
        collectionview = CollectionView.sharedInstance.getCollectionView(indetifier: cellId, view: self.view, cellSize: 500)
        collectionview.dataSource = self
        collectionview.delegate = self
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
