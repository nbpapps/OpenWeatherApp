//
//  CityFutureForecastTableViewController.swift
//  OpenWeatherApp
//
//  Created by niv ben-porath on 09/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class CityFutureForecastTableViewController: UITableViewController {

    private lazy var dataSource = makeTableViewDataSource()
//    let cityWeatherViewModel : CityWeatherViewModel

    var onIndexPathSelected : (IndexPath) -> () = {IndexPath in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
    }
    
    
    //MARK: - init
    init(){//cityWeatherViewModel : CityWeatherViewModel){
//        self.cityWeatherViewModel = cityWeatherViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Texts.noStoryboardImplementation)
    }
    
    //MARK: - config
    private func configureView() {
        view.backgroundColor = .mainColor
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.reuseId)
        tableView.rowHeight = UITableView.forecastRowHeight
        tableView.separatorColor = .mainColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func configureTableView() {
        tableView.dataSource = dataSource
    }
    
    //MARK: - factory
    private func makeTableViewDataSource() -> CityForecastViewModel {
        return CityForecastViewModel()
//        return TableViewDataSource(cityWeatherViewModel: cityWeatherViewModel)
        
    }

   
}