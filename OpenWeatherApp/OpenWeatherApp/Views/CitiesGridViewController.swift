//
//  CitiesGridViewController.swift
//  OpenWeatherApp
//
//  Created by niv ben-porath on 04/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class CitiesGridViewController: UIViewController,UICollectionViewDelegate {
    
    private lazy var collectionView = makeCollectionView()
    private lazy var dataSource = makeCollectionViewDataSource()

    let citiesViewModel : CitiesViewModel
    
    
    //MARK: - init
    init(citiesViewModel : CitiesViewModel){
        self.citiesViewModel = citiesViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Texts.noStoryboardImplementation)
    }
    
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionView()
    }
    
    //MARK: - factory
    private func makeCollectionView() -> UICollectionView {
        let colllectionView =  UICollectionView(frame: view.bounds, collectionViewLayout:UIConfig.createFlowLayout(in: view, numberOfColums: UICollectionView.numberOfCollectionViewColums))
        
        return colllectionView
    }
    
    private func makeCollectionViewDataSource() -> CollectionViewDataSource {
        return CollectionViewDataSource(citiesViewModel: citiesViewModel)
    }
    
    //MARK: - cofig
    private func configureView() {
        view.backgroundColor = .mainColor
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: CityCollectionViewCell.reuseId)
    }
    
}